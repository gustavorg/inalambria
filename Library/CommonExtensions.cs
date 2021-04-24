using System;

namespace inalambria.Library
{
    public static class CommonExtensions
	{
		public static class Constants
		{
			public const string ConnectionString = "Server=DESKTOP-ODDDHAM\\SQLEXPRESS;Database=inalambria;Trusted_Connection=True;User Id=sa;Password=.;Integrated Security=false;MultipleActiveResultSets=true";

			public static System.Globalization.CultureInfo AppCultureInfo { get { return new System.Globalization.CultureInfo("en-US"); } }
		}

	}
}