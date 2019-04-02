package zh.dockerproject;

/**
 * Created by zhanghao on 2018/9/9.
 */
public class deployInfo {
    private String serverIp;
    private String dockerImage;

    public void setDockerImage(String dockerImage) {
        this.dockerImage = dockerImage;
    }

    public String getDockerImage() {
        return dockerImage;
    }

    public void setServerIp(String serverIp) {
        this.serverIp = serverIp;
    }

    public String getServerIp() {
        return serverIp;
    }
}
