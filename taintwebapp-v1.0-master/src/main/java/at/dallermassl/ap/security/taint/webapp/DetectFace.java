package at.dallermassl.ap.security.taint.webapp;

import com.alibaba.fastjson.JSON;
import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.profile.ClientProfile;
import com.tencentcloudapi.common.profile.HttpProfile;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.tencentcloudapi.iai.v20180301.IaiClient;
import com.tencentcloudapi.iai.v20180301.models.DetectFaceRequest;
import com.tencentcloudapi.iai.v20180301.models.DetectFaceResponse;
import com.tencentcloudapi.iai.v20180301.models.FaceInfo;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;


public class DetectFace {
    public static String Contrast(String filepath1,String filepath2) {
        String respstr = null;
        try {
            String SecretId = "AKID2wd6KZnsmQtupcL0UlodCVZ5PUJr9BxS";
            String SecretKey = "KUO6E7kEUUD7ylNnlUxEJHCuMr64mEPK";
            String imageUrl = filepath1;//"C:\\Users\\moresec\\Downloads\\haha.png";
            String markImageUrl = filepath2;//"C:\\Users\\moresec\\Downloads\\haha_res.png";

            // 替换自己的密钥
            Credential cred = new Credential(SecretId, SecretKey);

            HttpProfile httpProfile = new HttpProfile();
            httpProfile.setEndpoint("iai.tencentcloudapi.com");

            ClientProfile clientProfile = new ClientProfile();
            clientProfile.setHttpProfile(httpProfile);

            IaiClient client = new IaiClient(cred, "ap-beijing", clientProfile);

            HashMap map = new HashMap<String, String>(8);
            String image = getBase64Image(imageUrl);
            map.put("Image", image);
            map.put("NeedQualityDetection", "1");
            String params = JSON.toJSONString(map);
            DetectFaceRequest req = DetectFaceRequest.fromJsonString(params, DetectFaceRequest.class);
            DetectFaceResponse resp = client.DetectFace(req);
            //System.out.println(DetectFaceRequest.toJsonString(resp));
            respstr = DetectFaceRequest.toJsonString(resp);

            FaceInfo[] faceInfos = resp.getFaceInfos();
            long height = faceInfos[0].getHeight();
            long width = faceInfos[0].getWidth();
            long x = faceInfos[0].getX();
            long y = faceInfos[0].getY();
            // 将人脸标注起来

            BufferedImage bufferedImage = ImageIO.read(new File(imageUrl));
            Graphics g = bufferedImage.getGraphics();
            g.setColor(Color.RED);
            //矩形框(原点x坐标，原点y坐标，矩形的长，矩形的宽)
            g.drawRect((int) x, (int) y, (int) width, (int) height);
            g.dispose();
            FileOutputStream out = new FileOutputStream(markImageUrl);
            ImageIO.write(bufferedImage, "png", out);
            System.out.println("sudddssssss");
        } catch (TencentCloudSDKException | IOException e) {
            System.out.println(e.toString());
        }
        return respstr;
    }

    private static String getBase64Image(String url) {

        try {
            return getBase64Image(new FileInputStream(url));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static String getBase64Image(FileInputStream inputStream) {
        try {

            byte[] data = new byte[inputStream.available()];
            inputStream.read(data);
            inputStream.close();
            BASE64Encoder encoder = new BASE64Encoder();
            return encoder.encode(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;

    }

}
