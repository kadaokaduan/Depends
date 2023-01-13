package at.dallermassl.ap.security.taint.webapp;

//import com.alibaba.fastjson.JSON;
import com.huaweicloud.sdk.core.auth.ICredential;
import com.huaweicloud.sdk.core.auth.BasicCredentials;
import com.huaweicloud.sdk.core.exception.ConnectionException;
import com.huaweicloud.sdk.core.exception.RequestTimeoutException;
import com.huaweicloud.sdk.core.exception.ServiceResponseException;
import com.huaweicloud.sdk.imagesearch.v1.*;
import com.huaweicloud.sdk.imagesearch.v1.model.*;
import com.huaweicloud.sdk.imagesearch.v1.region.ImageSearchRegion;

import static java.lang.System.out;

/**
 * 华为云图像搜索之添加图片
 */

public class RunAddPictureSolution {

    public String addPtic(String pticpath) {
       out.println(pticpath);
        //设置获取的AK和SK
        String ak = "PXW9NEZZPQ1ZWVFJOQEE";
        String sk = "NcsgRnaMh68cRuGO4YXh4vmNGY2s1GfNV1VKW0HX";

        ICredential auth = new BasicCredentials()
                .withAk(ak)
                .withSk(sk);

        ImageSearchClient client = ImageSearchClient.newBuilder()
                .withCredential(auth)
                //设置region， 示例中region为北京四
                .withRegion(ImageSearchRegion.valueOf("cn-north-4"))
                .build();

        RunAddPictureRequest request = new RunAddPictureRequest();
        request.setInstanceName("timagesearch-e5h9");
        AddPictureRequestReq req = new AddPictureRequestReq();
        //添加图片，setPath设置图像的URL
        req.setPath(pticpath);
        request.setBody(req);
        try {
            RunAddPictureResponse response = client.runAddPicture(request);
            System.out.println(response);
        } catch (ConnectionException e) {
            e.printStackTrace();
        } catch (RequestTimeoutException e) {
            e.printStackTrace();
        } catch (ServiceResponseException e) {
            System.out.println(e.getHttpStatusCode());
            System.out.println(e.getErrorCode());
            System.out.println(e.getErrorMsg());
        }

        return "ok";

    }
}
