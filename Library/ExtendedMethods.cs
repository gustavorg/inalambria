using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;
using System.Data;
using System.ComponentModel;

namespace inalambria.Library
{
	public static class ExtendedMethods
	{
		
		public static String ToFixedLeft(this string txt, int num, char fill)
		{
			string rtn = "";

			if (txt.Length < num)
			{
				rtn = txt.Substring(txt.Length - num);
			} 
			else 
			{
				rtn = txt.Substring(txt.Length - num);
			}

			return rtn;
		}
		
		public static String ToFixedRight(this string txt, int num, char fill) 
		{
			string rtn = "";

			if (txt.Length < num)
			{
				rtn = txt.Substring(0, num);
			} 
			else 
			{
				rtn = txt.Substring(0, num);
			}

			return rtn;
		}
		
		//public static TicketInfo CurrentTicket(this HttpSessionState pSession)
		//{

		//    TicketInfo rtn = null;
		//    if (pSession["Ticket"] != null)
		//    {
		//        rtn = (TicketInfo)pSession["Ticket"];
		//    }
		//    else
		//    {
		//        //rtn = new TicketInfo();
		//        //rtn.User = new UserInfo();
		//        //rtn.User.UserId = 1;
		//        //rtn.User.UserName = "user01";
		//        rtn = null;
		//    }
		//    return rtn;
		//}

		public static DateTime ConvertToDateTime(this string txt)
		{
			DateTime rtn = DateTime.MinValue;
			//string cultureCode = "es-ES";
			//CultureInfo cultureInfo = new System.Globalization.CultureInfo(cultureCode);
			CultureInfo cultureInfo = CommonExtensions.Constants.AppCultureInfo;
			DateTime.TryParse(txt, cultureInfo, System.Globalization.DateTimeStyles.None, out rtn);
			//DateTime.TryParse(txt, out rtn);
			return rtn;
		}

		private static DateTime? GetDateTime(string text)
		{
			DateTime? rtn = null;

			string[] parts = text.Split('/');
			int dd = Convert.ToInt32(parts[0]); //Convert.ToInt32(periodoId.Substring(6, 2));
			int mm = Convert.ToInt32(parts[1]); //Convert.ToInt32(periodoId.Substring(4, 2));
			int yyyy = Convert.ToInt32(parts[2]); //Convert.ToInt32(periodoId.Substring(0, 4));
			try
			{
				rtn = new DateTime(yyyy, mm, dd);
			}
			catch (Exception)
			{
				rtn = null;
			}
			
			return rtn;
		}
		public static DateTime ConvertToDateTime2(this string text)
		{
			if (text == null || string.IsNullOrEmpty(text)) return DateTime.MinValue;

			System.Globalization.CultureInfo cInfo = System.Threading.Thread.CurrentThread.CurrentUICulture;
			//string format = "dd/MM/yyyy";
			//string format = "MM/dd/yyyy";
			//if (cInfo.Name.IndexOf("en-") >= 0) format = "MM/dd/yyyy";

			string[] str = text.Split(' ');
			string date = str[0];
			string time = str[1];
			DateTime? dt = GetDateTime(date); //DateTime.ParseExact(date, format, cInfo);
			TimeSpan tm;
			TimeSpan.TryParse(time, out tm);
			if (dt.HasValue)
			{
				dt = new DateTime(dt.Value.Year, dt.Value.Month, dt.Value.Day, tm.Hours, tm.Minutes, tm.Seconds);
			}
			else
			{
				dt = DateTime.MinValue;
			}

			return dt.Value;
		}
		public static DateTime ConvertToDateTime(this object value)
		{
			DateTime rtn = DateTime.MinValue;
			try
			{
				rtn = Convert.ToDateTime(value);
			}
			catch (Exception)
			{
				rtn = DateTime.MinValue;
			}

			return rtn;
		}
		public static DateTime? ConvertToNullableDateTime(this string value)
		{
			DateTime? rtn = null;
			try
			{
                if (value != null)
                {
                    DateTime temp;
                    bool result = DateTime.TryParse(value, out temp);
                    if (!result)
                    {
                        rtn = null;
                    }
                    else
                    {
                        rtn = temp;
                    }
                    //rtn = Convert.ToDateTime(value);
                }
			}
			catch (Exception)
			{
				rtn = null;
			}

			return rtn;
		}

		public static string ConvertToString(this DateTime txt)
		{
			return (txt == DateTime.MinValue ? string.Empty : String.Format("{0:dd/MM/yyyy}", txt));
		}

		public static string ConvertToString(this DateTime? txt)
		{
			return (txt == null ? string.Empty : String.Format("{0:dd/MM/yyyy}", txt));
		}

		public static string ConvertToMoney(this decimal txt)
		{
			return (txt < 10 ? Convert.ToInt32(txt).ToString() : String.Format("{0:0,0}", txt));
		}

		public static string ConvertToCurrency(this decimal number, int decimals)
		{
			System.Globalization.NumberFormatInfo nfi = new System.Globalization.NumberFormatInfo();

			nfi.CurrencyDecimalDigits = decimals;

			nfi.CurrencySymbol = "$";

			return String.Format(nfi, "{0:c}", number);
		}

		public static int ConvertToInteger(this string txt)
		{
			if (string.IsNullOrEmpty(txt)) return 0;
			if (txt.Trim() == "") return 0;
			txt = txt.Replace("$", "");
			txt = txt.Replace("%", "");
			txt = txt.Replace(",", "");
			txt = txt.Replace("'", "");
            txt = txt.Replace("S/.", "");
            txt = txt.Trim();
			bool isNegative = false;
			if (txt.IndexOf("(") >= 0 && txt.IndexOf(")") >= 0)
			{
				txt = txt.Replace("(", "");
				txt = txt.Replace(")", "");
				isNegative = true;
			}

			int rtn = 0;
			//rtn = int.Parse(txt, new CultureInfo("en-GB"));
			int.TryParse(txt, out rtn);
			//int.TryParse(txt, System.Globalization.NumberStyles.AllowDecimalPoint, new CultureInfo("en-GB"), out rtn);
			if (isNegative) rtn *= (-1);
			return rtn;
		}

		public static long ConvertToLong(this string txt)
		{
			if (string.IsNullOrEmpty(txt)) return 0;
			if (txt.Trim() == "") return 0;
			txt = txt.Replace("$", "");
			txt = txt.Replace("%", "");
			txt = txt.Replace(",", "");
			txt = txt.Replace("'", "");

			bool isNegative = false;
			if (txt.IndexOf("(") >= 0 && txt.IndexOf(")") >= 0)
			{
				txt = txt.Replace("(", "");
				txt = txt.Replace(")", "");
				isNegative = true;
			}

			long rtn = 0;
			long.TryParse(txt, System.Globalization.NumberStyles.AllowDecimalPoint, new CultureInfo("en-GB"), out rtn);
			if (isNegative) rtn *= (-1);
			return rtn;
		}

		public static double ConvertToDouble(this string txt)
		{
			if (string.IsNullOrEmpty(txt)) return 0;
			if (txt.Trim() == "") return 0;
			txt = txt.Replace("$", "");
			txt = txt.Replace("%", "");
			txt = txt.Replace(",", "");
			txt = txt.Replace("'", "");

			bool isNegative = false;
			if (txt.IndexOf("(") >= 0 && txt.IndexOf(")") >= 0)
			{
				txt = txt.Replace("(", "");
				txt = txt.Replace(")", "");
				isNegative = true;
			}

			double rtn = 0;
			rtn = double.Parse(txt, new CultureInfo("en-GB"));
			//double.TryParse(txt, System.Globalization.NumberStyles.AllowDecimalPoint, new CultureInfo("en-GB"), out rtn);
			if (isNegative) rtn *= (-1);
			return rtn;
		}

		public static decimal ConvertToDecimal(this string txt)
		{
			if (string.IsNullOrEmpty(txt)) return 0;
			if (txt.Trim() == "") return 0;
			txt = txt.Replace("$", "");
			txt = txt.Replace("%", "");
			txt = txt.Replace(",", "");
			txt = txt.Replace("'", "");
            txt = txt.Replace("S/.", "");
			bool isNegative = false;
			if (txt.IndexOf("(") >= 0 && txt.IndexOf(")") >= 0)
			{
				txt = txt.Replace("(", "");
				txt = txt.Replace(")", "");
				isNegative = true;
			}

			decimal rtn = 0;
			try
			{
				rtn = decimal.Parse(txt, new CultureInfo("en-GB"));
				//decimal.TryParse(txt, System.Globalization.NumberStyles.AllowDecimalPoint, new CultureInfo("en-GB"), out rtn);
				if (isNegative) rtn *= (-1);
			}
			catch (Exception)
			{
				rtn = 0;
			}

			return rtn;
		}

		public static bool ConvertToBoolean(this string txt)
		{
			bool rtn = false;

			if (txt != null)
			{
				if (txt == "1" || txt.ToLower() == "true") rtn = true;
			}

			return rtn;
		}

		public static string ToStringApp(this DateTime dt)
		{
			string rtn = "";
			//rtn = dt.ToString(CommonExtensions.Constants.AppDateFormat);
			return rtn;
		}

		public static string ToStringPercentage(this decimal number, string formatString)
		{
			string rtn = "";
			rtn = (number / 100).ToString(formatString);
			return rtn;
		}

		//public static byte[] ConvertToImage(this System.Drawing.Image image)
		//{
		//    MemoryStream ms = new MemoryStream();
		//    image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
		//    return ms.ToArray();
		//}

		//public static System.Drawing.Image ConvertToByteArray(this byte[] byteArray)
		//{
		//    MemoryStream ms = new MemoryStream(byteArray);
		//    System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
		//    return returnImage;
		//}

		public static int GetInteger(this DataRow row, string fieldName)
		{
			int rtn = 0;
			try
			{
				int.TryParse(row[fieldName].ToString(), out rtn);
			}
			catch
			{
				rtn = 0;
			}
			return rtn;
		}

		public static string GetString(this DataRow row, string fieldName)
		{
			string rtn = "";
			try
			{
				rtn = row[fieldName].ToString();
			}
			catch
			{
				rtn = "";
			}
			return rtn;
		}

		public static Nullable<DateTime> GetDateTimeNullable(this DataRow row, string fieldName)
		{
			Nullable<DateTime> rtn = null;
			try
			{
				rtn = Convert.ToDateTime(row[fieldName].ToString(), CommonExtensions.Constants.AppCultureInfo);
				//DateTime.TryParse(row[fieldName].ToString(), out rtn);
			}
			catch
			{
				rtn = null;
			}
			return rtn;
		}

		public static DateTime GetDateTime(this DataRow row, string fieldName)
		{
			DateTime rtn = DateTime.MinValue;
			try
			{
                rtn = Convert.ToDateTime(row[fieldName].ToString());
				//rtn = Convert.ToDateTime(row[fieldName].ToString(), CommonExtensions.Constants.AppCultureInfo);
				//DateTime.TryParse(row[fieldName].ToString(), out rtn);
			}
			catch
			{
				rtn = DateTime.MinValue;
			}
			return rtn;
		}

		public static bool GetBoolean(this DataRow row, string fieldName)
		{
			bool rtn = false;
			try
			{
				string tmp = row[fieldName].ToString();
				if (tmp.ToLower().Equals("true") || tmp.Equals("1")) rtn = true;
			}
			catch
			{
				rtn = false;
			}
			return rtn;
		}

		public static decimal GetDecimal(this DataRow row, string fieldName)
		{
			decimal rtn = 0;
			try
			{
				decimal.TryParse(row[fieldName].ToString(), out rtn);
			}
			catch
			{
				rtn = 0;
			}
			return rtn;
		}

		

		public static byte[] GetByteArray(this DataRow row, string fieldName)
		{
			byte[] rtn = null;
			try
			{
				rtn = (byte[])row[fieldName];
			}
			catch
			{
				rtn = null;
			}
			return rtn;
		}

        public static DataTable ToDataTable<T>(this List<T> data)
        {
            PropertyDescriptorCollection props =
                TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            for (int i = 0; i < props.Count; i++)
            {
                PropertyDescriptor prop = props[i];
                table.Columns.Add(prop.Name, prop.PropertyType);
            }
            object[] values = new object[props.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = props[i].GetValue(item);
                }
                table.Rows.Add(values);
            }
            return table;
        }

		public static bool Between(this int number, int min, int max)
		{
			return (number >= min && number <= max);
		}
		public static bool Between(this DateTime value, DateTime from, DateTime to)
		{
			return (value >= from && value <= to);
		}

        public static string Trim2(this string txt)
        {
            if (txt == null) return null;
            return txt.Trim();
        }
        
        public static string ConvertToExcelRow(this int rownumber, string column)
        {
            return string.Format("{0}{1}", column, rownumber.ToString("0"));
        }

        //GRZ conversion de minutos a formato de horas
        public static string ConvertoMinsToTimeFormat(this int mins) {
            int hh = (int)Math.Floor((decimal)mins / 60);
            int mm = mins % 60;
            return string.Format("{0:00} : {1:00}", hh, mm);
        }
	}
}
