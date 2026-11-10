using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;

namespace schoolms
{
    /// <summary>Shared database + UI helpers.</summary>
    public static class Db
    {
        public static SqlConnection CreateConnection()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        }

        /// <summary>Shows a JavaScript alert on the page after postback.</summary>
        public static void Alert(Page page, string message)
        {
            string safe = message.Replace("\\", "\\\\").Replace("'", "\\'").Replace("\r", " ").Replace("\n", " ");
            ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "alert('" + safe + "');", true);
        }

        /// <summary>True if an admin, teacher or student is signed in.</summary>
        public static bool IsAnyoneLoggedIn(HttpSessionState session)
        {
            return session["user"] != null || session["teacher"] != null || session["Stud"] != null;
        }

        public static bool IsDuplicateKey(SqlException ex)
        {
            return ex.Number == 2627 || ex.Number == 2601;
        }
    }

    /// <summary>PBKDF2 (SHA1, 10000 iterations) password hashing. Stored as PBKDF2$iterations$salt$hash.</summary>
    public static class PasswordHasher
    {
        private const int Iterations = 10000;
        private const int SaltSize = 16;
        private const int HashSize = 32;

        public static string Hash(string password)
        {
            byte[] salt = new byte[SaltSize];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }
            byte[] hash = Derive(password, salt, Iterations);
            return "PBKDF2$" + Iterations + "$" + Convert.ToBase64String(salt) + "$" + Convert.ToBase64String(hash);
        }

        public static bool Verify(string password, string stored)
        {
            if (string.IsNullOrEmpty(stored) || password == null) return false;
            string[] parts = stored.Split('$');
            if (parts.Length != 4 || parts[0] != "PBKDF2") return false;
            int iterations;
            if (!int.TryParse(parts[1], out iterations)) return false;
            byte[] salt, expected;
            try
            {
                salt = Convert.FromBase64String(parts[2]);
                expected = Convert.FromBase64String(parts[3]);
            }
            catch (FormatException)
            {
                return false;
            }
            byte[] actual = Derive(password, salt, iterations);
            if (actual.Length != expected.Length) return false;
            int diff = 0;
            for (int i = 0; i < actual.Length; i++) diff |= actual[i] ^ expected[i];
            return diff == 0;
        }

        private static byte[] Derive(string password, byte[] salt, int iterations)
        {
            using (var kdf = new Rfc2898DeriveBytes(password, salt, iterations))
            {
                return kdf.GetBytes(HashSize);
            }
        }
    }
}
