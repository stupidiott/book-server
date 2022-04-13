package com.mypack.book.constants;

import lombok.Getter;

@Getter
public enum EnumBookStatus {


    LEND(1, "已借出"),

    NOT_LEND(0, "未借出");

    private Integer code;

    private String message;

    EnumBookStatus(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
