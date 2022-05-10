package com.example.testpay.entity;

/**
 * 支付结果回调接收类
 * <p>
 * 注意、注意、注意：此实体类返回的参数以接口返回为主，此类有可能少很多参数
 *
 * @Author xiaowuliu
 * @Version 1.0
 */

public class ResultPayEntity {

    /**
     *  * 注意、注意、注意：此实体类返回的参数以接口返回为主，此类有可能少很多参数
     * otherinfo :
     * orderId : oderpay-cd19afff-ec7f-4158-82d3-3087bde5e4a7
     * price : 0.40
     * name : 55
     * thirduid :
     * paytype : 1
     * remarks :
     */

    private String code;
    private String msg;
    private String otherinfo;
    private String orderId;
    private String price;
    private String name;
    private String thirduid;
    private String paytype;
    private String remarks;
    private String originalprice;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getOtherinfo() {
        return otherinfo;
    }

    public void setOtherinfo(String otherinfo) {
        this.otherinfo = otherinfo;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getThirduid() {
        return thirduid;
    }

    public void setThirduid(String thirduid) {
        this.thirduid = thirduid;
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getOriginalprice() {
        return originalprice;
    }

    public void setOriginalprice(String originalprice) {
        this.originalprice = originalprice;
    }

    @Override
    public String toString() {
        return "ResultPayCBModel{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                ", otherinfo='" + otherinfo + '\'' +
                ", orderId='" + orderId + '\'' +
                ", price='" + price + '\'' +
                ", name='" + name + '\'' +
                ", thirduid='" + thirduid + '\'' +
                ", paytype='" + paytype + '\'' +
                ", remarks='" + remarks + '\'' +
                ", originalprice='" + originalprice + '\'' +
                '}';
    }
}
