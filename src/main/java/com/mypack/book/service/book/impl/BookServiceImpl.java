package com.mypack.book.service.book.impl;

import com.github.pagehelper.PageHelper;
import com.mypack.book.constants.EnumBookStatus;
import com.mypack.book.constants.EnumResponse;
import com.mypack.book.dto.book.BookDTO;
import com.mypack.book.dto.book.BookSearchDTO;
import com.mypack.book.entity.EduBook;
import com.mypack.book.exception.BookNoExistException;
import com.mypack.book.mapper.BookMapper;
import com.mypack.book.service.book.BookService;
import ma.glasnost.orika.MapperFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private MapperFacade mapperFacade;

    @Override
    public List<BookDTO> list(BookSearchDTO searchDTO, boolean isPage) {

        if(isPage){
            PageHelper.startPage(searchDTO.getPageNum(),searchDTO.getPageSize());
        }

        return bookMapper.list(searchDTO);
    }

    @Override
    public void insert(BookDTO bookDTO) throws BookNoExistException {

        bookDTO.setStatus(EnumBookStatus.NOT_LEND.getCode());
        bookDTO.setCreateTime(new Date());

        int num = bookMapper.countNumByBookNo(bookDTO.getBookNo());

        if(num > 0){
            throw new BookNoExistException(EnumResponse.BOOK_NO_EXIST_EXCEPTION);
        }


        EduBook eduBook = mapperFacade.map(bookDTO, EduBook.class);

        bookMapper.insert(eduBook);
    }

    @Override
    public void update(BookDTO bookDTO) {

        if(null == bookDTO.getId()){
            return;
        }

        EduBook eduBook = mapperFacade.map(bookDTO, EduBook.class);

        bookMapper.updateById(eduBook);
    }

    @Override
    public void updateStatusByBookNo(String bookNo, Integer status) {
        bookMapper.updateStatusByBookNo(bookNo,status);
    }
}
