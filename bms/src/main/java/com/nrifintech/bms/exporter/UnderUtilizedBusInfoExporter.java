package com.nrifintech.bms.exporter;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.nrifintech.bms.model.UnderUtilizedBusInfo;

public class UnderUtilizedBusInfoExporter {

	public static ByteArrayInputStream exportUnderUtilizedBusInfo(List<UnderUtilizedBusInfo> underUtilizedBusList,
			int percentage) {
		try (Workbook workbook = new XSSFWorkbook()) {
			Sheet sheet = workbook.createSheet("under" + percentage + "PercentUtilizedBusList");

			Row row = sheet.createRow(0);
			CellStyle headerCellStyle = workbook.createCellStyle();
			headerCellStyle.setFillForegroundColor(IndexedColors.AQUA.getIndex());
			headerCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			// Creating header
			Cell cell = row.createCell(0);
			cell.setCellValue("Registration No");
			cell.setCellStyle(headerCellStyle);

			cell = row.createCell(1);
			cell.setCellValue("Bus Name");
			cell.setCellStyle(headerCellStyle);

			cell = row.createCell(2);
			cell.setCellValue("Fare Per Km");
			cell.setCellStyle(headerCellStyle);

			cell = row.createCell(3);
			cell.setCellValue("Facility");
			cell.setCellStyle(headerCellStyle);

			cell = row.createCell(4);
			cell.setCellValue("Route Code");
			cell.setCellStyle(headerCellStyle);

			cell = row.createCell(5);
			cell.setCellValue("Source");
			cell.setCellStyle(headerCellStyle);

			cell = row.createCell(6);
			cell.setCellValue("Destination");
			cell.setCellStyle(headerCellStyle);

			cell = row.createCell(7);
			cell.setCellValue("Maximum available bookings of last 30 days");
			cell.setCellStyle(headerCellStyle);

			cell = row.createCell(8);
			cell.setCellValue("Total Seats Booked of last 30 days");
			cell.setCellStyle(headerCellStyle);

			cell = row.createCell(9);
			cell.setCellValue("Percentage Seat Utilization of last 30 days (< " + percentage + "% )");
			cell.setCellStyle(headerCellStyle);

			// Creating data rows for each bus
			for (int i = 0; i < underUtilizedBusList.size(); i++) {
				Row dataRow = sheet.createRow(i + 1);
				dataRow.createCell(0).setCellValue(underUtilizedBusList.get(i).getRegNo());
				dataRow.createCell(1).setCellValue(underUtilizedBusList.get(i).getBusName());
				dataRow.createCell(2).setCellValue(underUtilizedBusList.get(i).getFarePerKm());
				dataRow.createCell(3).setCellValue(underUtilizedBusList.get(i).getFacilities());
				dataRow.createCell(4).setCellValue(underUtilizedBusList.get(i).getRoutecode());
				dataRow.createCell(5).setCellValue(underUtilizedBusList.get(i).getSource());
				dataRow.createCell(6).setCellValue(underUtilizedBusList.get(i).getDestination());
				dataRow.createCell(7).setCellValue(underUtilizedBusList.get(i).getTotalSeats());
				dataRow.createCell(8).setCellValue(underUtilizedBusList.get(i).getTotalSeatsBooked());
				dataRow.createCell(9).setCellValue(underUtilizedBusList.get(i).getPercentageSeatUtilization());
			}

			// Making size of column auto resize to fit with data
			sheet.autoSizeColumn(0);
			sheet.autoSizeColumn(1);
			sheet.autoSizeColumn(2);
			sheet.autoSizeColumn(3);
			sheet.autoSizeColumn(4);
			sheet.autoSizeColumn(5);
			sheet.autoSizeColumn(6);
			sheet.autoSizeColumn(7);
			sheet.autoSizeColumn(8);
			sheet.autoSizeColumn(9);

			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			workbook.write(outputStream);
			return new ByteArrayInputStream(outputStream.toByteArray());
		} catch (IOException ex) {
			ex.printStackTrace();
			return null;
		}
	}

}