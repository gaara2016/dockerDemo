package zh.dockerproject;

/**
 * Created by zhanghao on 2018/10/31.
 */
public class makeimageInfo {
    private String serverIp;
    private String applicationName;

    public void setServerIp(String serverIp) {
        this.serverIp = serverIp;
    }

    public void setApplicationName(String applicationName) {
        this.applicationName = applicationName;
    }

    public String getApplicationName() {
        return applicationName;
    }

    public String getServerIp() {
        return serverIp;
    }
}
