package com.mypack.book.service.borrow.impl;

import com.github.pagehelper.PageHelper;
import com.mypack.book.constants.EnumDeleteFlag;
import com.mypack.book.dto.borrow.BorrowBookDTO;
import com.mypack.book.dto.borrow.BorrowBookSearchDTO;
import com.mypack.book.entity.EduBorrowBook;
import com.mypack.book.mapper.BookMapper;
import com.mypack.book.mapper.BorrowBookMapper;
import com.mypack.book.service.borrow.BorrowBookService;
import ma.glasnost.orika.MapperFacade;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class BorrowBookServiceImpl implements BorrowBookService {

    @Autowired
    private BorrowBookMapper borrowBookMapper;
    @Autowired
    private MapperFacade mapperFacade;
    @Autowired
    private BookMapper bookMapper;

    @Override
    public List<BorrowBookDTO> list(BorrowBookSearchDTO searchDTO, boolean isPage) {

        if (isPage) {
            PageHelper.startPage(searchDTO.getPageNum(), searchDTO.getPageSize());
        }

        return borrowBookMapper.list(searchDTO);
    }

    @Override
    public void add(BorrowBookDTO borrowBookDTO) {

        borrowBookDTO.setCreateTime(new Date());
        borrowBookDTO.setDeleteFlag(EnumDeleteFlag.NO.getCode());

        EduBorrowBook eduBorrowBook = mapperFacade.map(borrowBookDTO, EduBorrowBook.class);
        borrowBookMapper.insert(eduBorrowBook);

        bookMapper.updateStatusByBookNo(borrowBookDTO.getBookNo(), -1);
    }

    @Override
    public void update(BorrowBookDTO borrowBookDTO) {

        if(borrowBookDTO.getId() == null){
            return;
        }

        EduBorrowBook eduBorrowBook = mapperFacade.map(borrowBookDTO, EduBorrowBook.class);

        borrowBookMapper.updateById(eduBorrowBook);
    }

    @Override
    public List<BorrowBookDTO> listByUsername(String username) {
        return borrowBookMapper.listByUsername(username);
    }
}
