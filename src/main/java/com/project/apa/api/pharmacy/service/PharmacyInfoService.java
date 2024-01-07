package com.project.apa.api.pharmacy.service;

import com.project.apa.api.pharmacy.domain.PharmacyInfoDTO;

public interface PharmacyInfoService {
    PharmacyInfoDTO getPharmacyInfo(String id);

	PharmacyInfoDTO getPharmacyOpeningInfo(String id);
}
