package com.project.apa.api.pharmacy.persistence;

import com.project.apa.api.pharmacy.domain.PharmacyInfoDTO;
import com.project.apa.mapper.PharmacyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * PharmacyInfoDAO 인터페이스를 구현한 PharmacyInfoDAOImp 클래스입니다.
 * 약국 정보 및 오픈 정보를 가져오는 작업을 수행합니다.
 * @author 김민정
 */
@Repository
public class PharmacyInfoDAOImp implements PharmacyInfoDAO {
	
	
	/**
     * PharmacyMapper를 주입받아 약국 정보를 가져오는 메서드입니다.
     *
     * @param id 약국 ID
     * @return 해당 약국의 정보를 담은 PharmacyInfoDTO 객체
     */
    @Autowired
    private PharmacyMapper pharmacyMapper;

    @Override
    public PharmacyInfoDTO getPharmacyInfo(String id) {
        return pharmacyMapper.getPharmacyInfo(id);
    }
    
    /**
     * PharmacyMapper를 이용하여 약국의 오픈 정보를 가져오는 메서드입니다.
     *
     * @param id 약국 ID
     * @return 해당 약국의 오픈 정보를 담은 PharmacyInfoDTO 객체
     */
    
    @Override
    public PharmacyInfoDTO getPharmacyOpeningInfo(String id) {
    	return pharmacyMapper.getPharmacyOpeningInfo(id);
    }
}
