package com.project.apa.api.pharmacy.persistence;

import com.project.apa.api.pharmacy.domain.PharmacyInfoDTO;

public interface PharmacyInfoDAO {
    PharmacyInfoDTO getPharmacyInfo(String id);

	PharmacyInfoDTO getPharmacyOpeningInfo(String id);
}
