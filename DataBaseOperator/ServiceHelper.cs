using System;
using System.Collections.Generic;
using System.Text;
//添加windows服务所需引用空间System.Service.Process.dll
using System.ServiceProcess;
namespace DataBaseOperator
{
    public class ServiceHelper
    {
        public static bool ExistSqlServerService(string serviceName)
        {
            bool ExistFlag = false;
            ServiceController services = GetServiceController(serviceName);
            if (services != null)
            {
                ExistFlag = true;
            }   
            return ExistFlag;
        }

        /// <summary>
        /// 获取状态
        /// </summary>
        /// <returns></returns>
        public static ServiceControllerStatus GetSqlServerServiceStatus(string serviceName)
        {
            ServiceController services= GetServiceController(serviceName);
            if (services != null)
            {
                return services.Status;
            }
            else
                return ServiceControllerStatus.Stopped;
           
        }
        /// <summary>
        /// 查询指定名称的服务
        /// </summary>
        /// <param name="serviceName"></param>
        /// <returns></returns>
        private static ServiceController[] GetServiceControllerByDisplayName(string serviceDisplayName)
        {
            ServiceController[] service = ServiceController.GetServices();
            System.Collections.ArrayList al = new System.Collections.ArrayList();
            for (int i = 0; i < service.Length; i++)
            {
                if (service[i].DisplayName.ToString().IndexOf(serviceDisplayName) > -1)
                {
                    al.Add(service[i]);
                }
            }
            return (ServiceController[])al.ToArray(typeof(ServiceController)); 
        }

        /// <summary>
        /// 查询指定名称的服务
        /// </summary>
        /// <param name="serviceName"></param>
        /// <returns></returns>
        private static ServiceController GetServiceController(string serviceName)
        {
            ServiceController[] service = ServiceController.GetServices();
            System.Collections.ArrayList al = new System.Collections.ArrayList();
            for (int i = 0; i < service.Length; i++)
            {
                if (service[i].ServiceName.IndexOf(serviceName) > -1)
                {
                    return service[i];
                }
            }
            return null;
        }


        public static void Stop(string serviceName)
        {
            ServiceController services = GetServiceController(serviceName);
            if (services != null)
            {
                if (services.CanStop && services.Status != ServiceControllerStatus.Stopped)
                {
                    services.Stop();
                    services.WaitForStatus(ServiceControllerStatus.Stopped);
                }
            }
            else
                return;

        }

        public static void Start(string serviceName, string[] args)
        {
            ServiceController services = GetServiceController(serviceName);
            if (services != null)
            {
                if (services.Status != ServiceControllerStatus.Running)
                {
                    
                    services.Start(args);
                    services.WaitForStatus(ServiceControllerStatus.Running);
                }
                
            }
            else
                return;

        }

    }
}
