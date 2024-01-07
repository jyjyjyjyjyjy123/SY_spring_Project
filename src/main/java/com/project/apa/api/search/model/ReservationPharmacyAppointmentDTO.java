package com.project.apa.api.search.model;

import lombok.Data;

@Data
public class ReservationPharmacyAppointmentDTO {
	private String appointmentseq;
	private String dispenselistseq;
	private String pharmacyid;
	private String pickupway;
	private String regdate;
	
	
	private String dispensestatusseq;
	private String dispensestatus;
}
