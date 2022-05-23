package com.mypack.book.constants;

import lombok.Getter;

@Getter
public enum EnumStatus {


    ACTIVE(1, "有效"),

    INACTIVE(0, "无效");

    private Integer code;

    private String message;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    EnumStatus(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
