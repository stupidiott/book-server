package com.mypack.book.dto.borrow;

import com.mypack.book.dto.PageForm;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BorrowBookSearchDTO extends PageForm {

    private String bookNo;

    private Integer deleteFlag;


}
