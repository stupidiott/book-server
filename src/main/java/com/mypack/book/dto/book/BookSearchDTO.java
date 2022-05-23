package com.mypack.book.dto.book;

import com.mypack.book.dto.PageForm;
import lombok.Data;

@Data
public class BookSearchDTO extends PageForm {

    private String bookName;
    private Integer status;

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
