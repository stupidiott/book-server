package com.mypack.book.exception;

import com.mypack.book.constants.EnumResponse;
import lombok.Data;

@Data
public class BookNoExistException extends Exception {


    private EnumResponse enumResponse;

    public BookNoExistException() {
        super();
    }

    public BookNoExistException(EnumResponse enumResponse){
        this.enumResponse = enumResponse;
    }

    public BookNoExistException(String message) {
        super(message);
    }


    public BookNoExistException(String message, Throwable cause) {
        super(message, cause);
    }


    public BookNoExistException(Throwable cause) {
        super(cause);
    }


    protected BookNoExistException(String message, Throwable cause,
                                   boolean enableSuppression,
                                   boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}
