package com.mypack.book.dto.borrow;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BorrowBookDTO {

    private Integer id;
    private String bookNo;
    private String bookName;
    private String borrowIdentityNo;
    private Date startTime;
    private Date endTime;
    private Date createTime;
    private Integer deleteFlag;
    private Date returnTime;
    private Integer kind;

}
