package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.persistance.mapper.IBoardMapper;
import poly.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService{

	@Resource(name = "BoardMapper")
	IBoardMapper boardMapper;
	
	// 공지사항 리스트 불러오기
	@Override
	public List<BoardDTO> getBoardList()throws Exception{
		
		return boardMapper.getBoardList();
	}
	
	// 공지사항 글 작성
	@Override
	public int insertPost(BoardDTO pDTO) throws Exception{
		
		return boardMapper.insertPost(pDTO);
	}

	// 공지사항 글 상세보기
	@Override
	public BoardDTO getPostDetail(BoardDTO pDTO) throws Exception{
		
		return boardMapper.getPostDetail(pDTO);
	}

	// 공지사항 글 삭제
	@Override
	public int deletePost(BoardDTO pDTO) throws Exception{
		// TODO Auto-generated method stub
		return boardMapper.deletePost(pDTO);
	}

	// 공지사항 글 수정
	@Override
	public int updatePost(BoardDTO pDTO) throws Exception{
		// TODO Auto-generated method stub
		return boardMapper.updatePost(pDTO);
	}

}
