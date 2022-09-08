//package com.nrifintech.bms.exporter;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletOutputStream;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.CellStyle;
//import org.apache.poi.ss.usermodel.FillPatternType;
//import org.apache.poi.ss.usermodel.IndexedColors;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.xssf.usermodel.XSSFFont;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//
//import com.nrifintech.bms.entity.Ticket;
//
//public class DepartureSheetExporter {
//	private XSSFWorkbook workbook;
//	private XSSFSheet sheet;	
//	private List<Ticket> listTickets;
//	//Constructor
//	public DepartureSheetExporter(List<Ticket> listTickets) {
//		this.listTickets = listTickets;
//		workbook = new XSSFWorkbook();
//		sheet = workbook.createSheet("departureList");
//	}
//	
//	
//	private void writeHeaderRow() {
//		Row row = sheet.createRow(0);
//		
//		CellStyle style = workbook.createCellStyle();
//		XSSFFont font = workbook.createFont();
//		font.setBold(true);
//		font.setFontHeight(16);
//		style.setFont(font);
//		style.setFillForegroundColor(IndexedColors.AQUA.getIndex());
//        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//		
//		Cell cell = row.createCell(0);
//		cell.setCellValue("User ID");	
//		cell.setCellStyle(style);
//		
//		cell = row.createCell(1);
//		cell.setCellValue("PNR Number");
//		cell.setCellStyle(style);
//		
//		cell = row.createCell(2);
//		cell.setCellValue("Name");
//		cell.setCellStyle(style);
//		
//		cell = row.createCell(3);
//		cell.setCellValue("Seats Booked");
//		cell.setCellStyle(style);
//		
//		cell = row.createCell(4);
//		cell.setCellValue("Date of bought");
//		cell.setCellStyle(style);
//		
//		cell = row.createCell(5);
//		cell.setCellValue("Fare");
//		cell.setCellStyle(style);
//	}
//	private void writeDataRow() {
//		int rowCount = 1;
//		
//		CellStyle style = workbook.createCellStyle();
//		XSSFFont font = workbook.createFont();
//		font.setFontHeight(14);
//		style.setFont(font);
//		
//		for(Ticket ticket: listTickets) {
//			Row row = sheet.createRow(rowCount++);
//			
//			Cell cell = row.createCell(0);
//			cell.setCellValue(ticket.getUser().getUserid());
//			sheet.autoSizeColumn(0);
//			cell.setCellStyle(style);
//			
//			cell = row.createCell(1);
//			cell.setCellValue(ticket.getPnrNo());
//			sheet.autoSizeColumn(1);
//			cell.setCellStyle(style);
//			
//			cell = row.createCell(2);
//			cell.setCellValue(ticket.getUser().getName());
//			sheet.autoSizeColumn(2);
//			cell.setCellStyle(style);
//			
//			cell = row.createCell(3);
//			cell.setCellValue(ticket.getSeatsBooked());
//			sheet.autoSizeColumn(3);
//			cell.setCellStyle(style);
//			
//			cell = row.createCell(4);
//			cell.setCellValue(ticket.getDateBought().toString());
//			sheet.autoSizeColumn(4);
//			cell.setCellStyle(style);
//			
//			cell = row.createCell(5);
//			cell.setCellValue(ticket.getTotalAmount());
//			sheet.setColumnWidth(5, 10 * 256);
//			cell.setCellStyle(style);
//		}
//	}
//	public void export(HttpServletResponse response) throws IOException{
//		writeHeaderRow();
//		writeDataRow();
//		
//		ServletOutputStream outputStream = response.getOutputStream();
//		workbook.write(outputStream);
//		workbook.close();
//		outputStream.close();
//	}
//}

package com.nrifintech.bms.exporter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.nrifintech.bms.entity.Ticket;

public class DepartureSheetExporter {
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private List<Ticket> listTickets;

	// Constructor
	public DepartureSheetExporter(List<Ticket> listTickets) {
		this.listTickets = listTickets;
		workbook = new XSSFWorkbook();
		sheet = workbook.createSheet("departureList");
	}

	private void writeHeaderRow() {
		Row row = sheet.createRow(0);

		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeight(16);
		style.setFont(font);
		style.setFillForegroundColor(IndexedColors.AQUA.getIndex());
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		Cell cell = row.createCell(0);
		cell.setCellValue("PNR Number");
		cell.setCellStyle(style);

		cell = row.createCell(1);
		cell.setCellValue("Name");
		cell.setCellStyle(style);

		cell = row.createCell(2);
		cell.setCellValue("Seats Booked");
		cell.setCellStyle(style);

		cell = row.createCell(3);
		cell.setCellValue("Booking Date");
		cell.setCellStyle(style);

		cell = row.createCell(4);
		cell.setCellValue("Fare");
		cell.setCellStyle(style);
	}

	private void writeDataRow() {
		int rowCount = 1;

		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(14);
		style.setFont(font);

		for (Ticket ticket : listTickets) {
			Row row = sheet.createRow(rowCount++);

			Cell cell = row.createCell(0);
			cell.setCellValue(ticket.getPnrNo());
			sheet.autoSizeColumn(0);
			cell.setCellStyle(style);

			cell = row.createCell(1);
			cell.setCellValue(ticket.getUser().getName());
			sheet.autoSizeColumn(1);
			cell.setCellStyle(style);

			cell = row.createCell(2);
			cell.setCellValue(ticket.getSeatsBooked());
			sheet.autoSizeColumn(2);
			cell.setCellStyle(style);

			cell = row.createCell(3);
			cell.setCellValue(ticket.getDateBought().toString());
			sheet.autoSizeColumn(3);
			cell.setCellStyle(style);

			cell = row.createCell(4);
			cell.setCellValue(ticket.getTotalAmount());
			sheet.setColumnWidth(4, 10 * 256);
			cell.setCellStyle(style);

		}
	}

	public void export(HttpServletResponse response) throws IOException {
		writeHeaderRow();
		writeDataRow();

		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();
		outputStream.close();
	}
}
