using System;
using System.IO;
using System.Net;
using System.Runtime.Serialization;
using System.Text;
using System.Web;
using System.Text.RegularExpressions;
namespace Translator
{
    class GoogleTranslate
    {
        /// <summary>
        /// TranslatePostMethod
        /// </summary>
        /// <param name="sourceText"></param>
        /// <param name="langPair"></param>
        /// <returns></returns>
        public static string Execute(string sourceText, string fromLan, string toLan)
        {
            HttpWebRequest requestScore = (HttpWebRequest)WebRequest.Create("http://translate.google.com/translate_t#");
            StringBuilder postContent = new StringBuilder();
            Encoding myEncoding = Encoding.UTF8;
            postContent.Append(HttpUtility.UrlEncode("hl", myEncoding));
            postContent.Append("=");
            postContent.Append(HttpUtility.UrlEncode("en", myEncoding));
            postContent.Append("&");
            postContent.Append(HttpUtility.UrlEncode("ie", myEncoding));
            postContent.Append("=");
            postContent.Append(HttpUtility.UrlEncode("UTF-8", myEncoding));
            postContent.Append("&");
            postContent.Append(HttpUtility.UrlEncode("sl", myEncoding));
            postContent.Append("=");
            postContent.Append(HttpUtility.UrlEncode(fromLan, myEncoding));
            postContent.Append("&");
            postContent.Append(HttpUtility.UrlEncode("text", myEncoding));
            postContent.Append("=");
            postContent.Append(HttpUtility.UrlEncode(sourceText, myEncoding));
            postContent.Append("&");
            postContent.Append(HttpUtility.UrlEncode("tl", myEncoding));
            postContent.Append("=");
            postContent.Append(HttpUtility.UrlEncode(toLan, myEncoding));

            byte[] data = Encoding.ASCII.GetBytes(postContent.ToString());
            requestScore.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)";
            requestScore.Method = "Post";
            requestScore.ContentLength = data.Length;
            requestScore.KeepAlive = true;
            requestScore.Timeout = (1 * 60 * 1000);
            requestScore.ProtocolVersion = HttpVersion.Version10;

            Stream stream = requestScore.GetRequestStream();
            stream.Write(data, 0, data.Length);
            stream.Close();
            string content = string.Empty;
            try
            {
                System.Net.ServicePointManager.Expect100Continue = false;
                HttpWebResponse responseSorce = (HttpWebResponse)requestScore.GetResponse();
                StreamReader reader = new StreamReader(responseSorce.GetResponseStream());
                content = reader.ReadToEnd();
                responseSorce.Close();
                reader.Dispose();
                stream.Dispose();
            }
            catch (WebException ex)
            {
                HttpWebResponse responseSorce = (HttpWebResponse)ex.Response;
                StreamReader reader = new StreamReader(responseSorce.GetResponseStream());
                content = reader.ReadToEnd();
                responseSorce.Close();
                reader.Dispose();
                stream.Dispose();
            }
            finally
            {
                requestScore.Abort();
            }
            string reg = @"<(?<HtmlTag>[\w]+)[^>]*\s[iI][dD]=(?<Quote>[""']?)result_box(?(Quote)\k<Quote>)[""']?[^>]*>((?<Nested><\k<HtmlTag>[^>]*>)|</\k<HtmlTag>>(?<-Nested>)|.*?)*</\k<HtmlTag>>";
            Regex r = new Regex(reg);
            MatchCollection mcItem = r.Matches(content);
            return ConvertHtmlToText(mcItem[0].Value);
        }

        /// <summary>
        /// ConvertHtmlToText
        /// </summary>
        /// <param name="source"></param>
        /// <returns></returns>
        public static string ConvertHtmlToText(string source)
        {
            string result;
            //remove line breaks,tabs
            result = source.Replace("\r", " ");
            result = result.Replace("\n", " ");
            result = result.Replace("\t", " ");
            //remove the header
            result = Regex.Replace(result, "(<head>).*(</head>)", string.Empty, RegexOptions.IgnoreCase);
            result = Regex.Replace(result, @"<( )*script([^>])*>", "<script>", RegexOptions.IgnoreCase);
            result = Regex.Replace(result, @"(<script>).*(</script>)", string.Empty, RegexOptions.IgnoreCase);
            //remove all styles
            result = Regex.Replace(result, @"<( )*style([^>])*>", "<style>", RegexOptions.IgnoreCase); //clearing attributes
            result = Regex.Replace(result, "(<style>).*(</style>)", string.Empty, RegexOptions.IgnoreCase);
            //insert tabs in spaces of <td> tags
            result = Regex.Replace(result, @"<( )*td([^>])*>", " ", RegexOptions.IgnoreCase);
            //insert line breaks in places of <br> and <li> tags
            result = Regex.Replace(result, @"<( )*br( )*>", "\r", RegexOptions.IgnoreCase);
            result = Regex.Replace(result, @"<( )*li( )*>", "\r", RegexOptions.IgnoreCase);
            //insert line paragraphs in places of <tr> and <p> tags
            result = Regex.Replace(result, @"<( )*tr([^>])*>", "\r\r", RegexOptions.IgnoreCase);
            result = Regex.Replace(result, @"<( )*p([^>])*>", "\r\r", RegexOptions.IgnoreCase);
            //remove anything thats enclosed inside < >
            result = Regex.Replace(result, @"<[^>]*>", string.Empty, RegexOptions.IgnoreCase);
            //replace special characters:
            result = Regex.Replace(result, @"&amp;", "&", RegexOptions.IgnoreCase);
            result = Regex.Replace(result, @"&nbsp;", " ", RegexOptions.IgnoreCase);
            result = Regex.Replace(result, @"&lt;", "<", RegexOptions.IgnoreCase);
            result = Regex.Replace(result, @"&gt;", ">", RegexOptions.IgnoreCase);
            result = Regex.Replace(result, @"&(.{2,6});", string.Empty, RegexOptions.IgnoreCase);
            //remove extra line breaks and tabs
            result = Regex.Replace(result, @" ( )+", " ");
            result = Regex.Replace(result, "(\r)( )+(\r)", "\r\r");
            result = Regex.Replace(result, @"(\r\r)+", "\r\n");
            return result;
        }
    }

}
