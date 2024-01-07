package com.project.apa.counseling.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.counseling.model.CounselingDTO;
import com.project.apa.counseling.model.CounselingPageDTO;
import com.project.apa.mapper.CounselingMapper;


/**
 * 상담과 관련된 데이터 액세스 구현 클래스
 */
@Repository
public class CounselingDAOImpl implements CounselingDAO{
	
	@Autowired
	private CounselingMapper cmapper;



	@Override
	public List<CounselingDTO> list(CounselingPageDTO pdto) {
		
		return null;
	}

	@Override
	public int getTotalCount(CounselingPageDTO pdto) {
		
		return 0;
	}

	@Override
	public CounselingDTO get(int mediCounselQuestionSeq) {
		
		return cmapper.get(mediCounselQuestionSeq);
	}

	@Override
	public void answeradd(CounselingDTO counselingdto) {
		
		System.out.println( counselingdto.getCounselAnswerContent());
		System.out.println( counselingdto.getMediCounselQuestionSeq());
		System.out.println( counselingdto.getDoctorSeq());
		
		cmapper.answeradd(counselingdto);
		
	}

	@Override
	public void answerupdate(CounselingDTO counselingdto) {
		cmapper.answerupdate(counselingdto);
	}

	@Override
	public CounselingDTO getcomplete(int mediCounselQuestionSeq) {
		
		return cmapper.getcomplete(mediCounselQuestionSeq);
	}

}
