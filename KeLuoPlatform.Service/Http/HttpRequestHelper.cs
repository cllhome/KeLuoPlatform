using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;

namespace KeLuoPlatform.Service.Http
{
    public class HttpRequestHelper
    {
        public static string PostToUrl(string requestUrl, byte[] byteArrayPost, Encoding encoding)
        {
            string stringResponse = "";
            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(requestUrl);
            webRequest.Method = "POST";
            webRequest.ContentType = "application/x-www-form-urlencoded";
            webRequest.ContentLength = byteArrayPost.Length;
            webRequest.CookieContainer = new CookieContainer();
            webRequest.Credentials = CredentialCache.DefaultCredentials;

            Stream newStream = webRequest.GetRequestStream();
            //写入参数
            newStream.Write(byteArrayPost, 0, byteArrayPost.Length);
            newStream.Close();

            WebResponse webResponse = webRequest.GetResponse();

            StreamReader responseStream = new StreamReader(webResponse.GetResponseStream(), encoding);
            stringResponse = responseStream.ReadToEnd();
            webResponse.Close();
            responseStream.Close();
            return stringResponse;
        }

        /// <summary>
        /// 提交数据到某网页
        /// </summary>
        public static string GetToUrl(string requestUrl, Encoding encoding)
        {

            string stringResponse = "";
            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(requestUrl);
            webRequest.Method = "Get";
            webRequest.ContentType = "application/x-www-form-urlencoded";

            webRequest.CookieContainer = new CookieContainer();
            webRequest.Credentials = CredentialCache.DefaultCredentials;
            WebResponse webResponse = webRequest.GetResponse();

            StreamReader responseStream = new StreamReader(webResponse.GetResponseStream(), encoding);
            stringResponse = responseStream.ReadToEnd();
            webResponse.Close();
            responseStream.Close();
            return stringResponse;
        }
    }


}
