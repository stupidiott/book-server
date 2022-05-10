package com.example.testpay.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.testpay.entity.ResultPayEntity;
import com.example.testpay.utils.ZZFHttpUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author xiaowuliu
 * @Version 1.0
 */
@RestController
public class ZZFPayController {


    @RequestMapping(value = "onlinepay", method = {RequestMethod.GET, RequestMethod.POST})
    public String onlinePay(HttpServletRequest request, String price, String name, String paytype) {
        String res = "";
        //统一下单
        HttpClient client = new HttpClient();
        PostMethod postMethod = new PostMethod(ZZFHttpUtils.CreateOrderURL);
        postMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
        HttpConnectionManagerParams managerParams = client.getHttpConnectionManager().getParams();
        // 设置连接超时时间(单位毫秒)
        managerParams.setConnectionTimeout(5000);
        // 设置读数据超时时间(单位毫秒)
        managerParams.setSoTimeout(5000);
        // 头信息
        postMethod.addRequestHeader("Payment-Key", ZZFHttpUtils.AppKey);
        postMethod.addRequestHeader("Payment-Secret", ZZFHttpUtils.AppSecret);
        postMethod.addParameter("price", price);
        postMethod.addParameter("name", name);
        //postMethod.addParameter("callbackurl", "指定回调地址（可选）不填写代表使用后台提交的默认地址");
        postMethod.addParameter("reurl", "http://localhost:8000/#/home");
        //postMethod.addParameter("thirduid", "您怎么提交给平台，平台原封不动返回");
        //postMethod.addParameter("remarks", "您怎么提交给平台，平台原封不动返回");
        // other=zzfpage-wxpay   代表返回微信收银台页面   other=zzfpage-alipay   代表返回支付宝收银台页面   自定义收银台“other”不要传这两个参数，下单后给您返回json数据，自行展示
        if (paytype != null && paytype.equals("0")) {
            postMethod.addParameter("other", "zzfpage-wxpay");
        } else {
            postMethod.addParameter("other", "zzfpage-alipay");
        }
        try {
            System.out.println(postMethod.getURI());
            int code = client.executeMethod(postMethod);
            if (code == 200) {
                res = postMethod.getResponseBodyAsString();
                System.out.println(res);
            }
        } catch (Exception e) {
            System.out.println("错误：" + e.getMessage());
            e.printStackTrace();
            request.setAttribute("name", e.getMessage());
            request.setAttribute("price", e.getMessage());
        }
        return res;
    }

    /**
     * 订单支付状态查询
     */
    @ResponseBody
    @RequestMapping(value = "findOrderState", method = {RequestMethod.GET, RequestMethod.POST})
    public Object findOrderState(String orderId) {
        String res = "";
        HttpClient client = new HttpClient();
        PostMethod postMethod = new PostMethod(ZZFHttpUtils.FindOrderURL);
        postMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
        HttpConnectionManagerParams managerParams = client.getHttpConnectionManager().getParams();
        // 设置连接超时时间(单位毫秒)
        managerParams.setConnectionTimeout(5000);
        // 设置读数据超时时间(单位毫秒)
        managerParams.setSoTimeout(5000);
        // 头信息
        postMethod.addRequestHeader("Payment-Key", ZZFHttpUtils.AppKey);
        postMethod.addRequestHeader("Payment-Secret", ZZFHttpUtils.AppSecret);
        postMethod.addParameter("orderId", orderId);
        try {
            System.out.println(postMethod.getURI());
            int code = client.executeMethod(postMethod);
            if (code == 200) {
                //解析站长付返回数据
                //  { "msg": "订单支付完成", "code": "10001", "state": "0" }
                res = postMethod.getResponseBodyAsString();
                System.out.println(res);
            }
        } catch (Exception e) {
            System.out.println("错误：" + e.getMessage());
            e.printStackTrace();
        }
        JSONObject jsonObject = JSONObject.parseObject(res);
        return jsonObject;
    }

    /*
     *  接收站长付发送的通知,数据格式如下
     *   {"code": 10001,"msg": "回调成功","other": "","orderId": "oderpay-445b1306-6f50-48dd-99c1-9a704108f8ff","price": "99.97","originalprice":"100","name": "开通超级VIP","reurl": "","thirduid": "15811111111","paytype": "0","remarks": ""}
     */
    @ResponseBody
    @RequestMapping(value = "/receiveNotify", method = {RequestMethod.GET, RequestMethod.POST})
    public void receiveCallBack(@RequestBody ResultPayEntity resultPay) {
        System.out.println("收到来自站长付的通知：" + resultPay.toString());
        //处理自己的业务逻辑
        //例如开通会员、用户充值等等。。。
    }
}
