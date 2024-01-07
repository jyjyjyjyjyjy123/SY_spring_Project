package com.project.apa.api.pharmacy.service;

import com.project.apa.api.pharmacy.domain.PharmacyInfoDTO;
import com.project.apa.api.pharmacy.persistence.PharmacyInfoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * PharmacyInfoDAO를 사용하여 약국 정보를 가져오는 기능을 구현한 PharmacyInfoServiceImp 클래스입니다.
 * @author 김민정
 */
@Service
public class PharmacyInfoServiceImp implements PharmacyInfoService {
	
	/**
     * PharmacyInfoDAO를 주입받아 사용합니다.
     */
    @Autowired
    private PharmacyInfoDAO pharmacyInfoDAO;
    
    /**
     * 주어진 약국 ID에 해당하는 약국 정보를 가져오는 메소드입니다.
     *
     * @param id 약국 ID
     * @return 주어진 ID에 해당하는 약국 정보(PharmacyInfoDTO)
     */
    @Override
    public PharmacyInfoDTO getPharmacyInfo(String id) {
        return pharmacyInfoDAO.getPharmacyInfo(id);
    }
    
    /**
     * 주어진 약국 ID에 해당하는 약국의 운영 정보를 가져오는 메소드입니다.
     *
     * @param id 약국 ID
     * @return 주어진 ID에 해당하는 약국의 운영 정보(PharmacyInfoDTO)
     */
    @Override
    public PharmacyInfoDTO getPharmacyOpeningInfo(String id) {
    	
    	return pharmacyInfoDAO.getPharmacyOpeningInfo(id);
    }
    
}
