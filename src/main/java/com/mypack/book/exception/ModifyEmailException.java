package com.mypack.book.exception;

import com.mypack.book.constants.EnumResponse;
import lombok.Data;

@Data
public class ModifyEmailException extends Exception {


    private EnumResponse enumResponse;

    public EnumResponse getEnumResponse() {
        return enumResponse;
    }

    public void setEnumResponse(EnumResponse enumResponse) {
        this.enumResponse = enumResponse;
    }

    public ModifyEmailException() {
        super();
    }

    public ModifyEmailException(EnumResponse enumResponse){
        this.enumResponse = enumResponse;
    }

    public ModifyEmailException(String message) {
        super(message);
    }


    public ModifyEmailException(String message, Throwable cause) {
        super(message, cause);
    }


    public ModifyEmailException(Throwable cause) {
        super(cause);
    }


    protected ModifyEmailException(String message, Throwable cause,
                                      boolean enableSuppression,
                                      boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}

