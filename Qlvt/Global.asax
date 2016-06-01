<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        Application["KhachTruyCap"] = 0;

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
        Application.Lock();
        Application["KhachTruyCap"] = Convert.ToInt32(Application["KhachTruyCap"]) - 1;
        Application.UnLock();

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        Application.Lock();
        Application["KhachTruyCap"] = Convert.ToInt32(Application["KhachTruyCap"]) + 1;
        Application.UnLock();

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        Application.Lock();
        Application["KhachTruyCap"] = Convert.ToInt32(Application["KhachTruyCap"]) - 1;
        Application.UnLock();

    }
       
</script>
