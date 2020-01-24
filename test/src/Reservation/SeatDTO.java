package Reservation;

/*seat_ID	int(11)	NO	PRI		auto_increment
seat_group	varchar(1)	NO			
seat_no	int(11)	NO			
seat_line_no	int(11)	NO			
screen_ID	int(11)	NO	MUL		
theater_ID	int(11)	NO			
*/

public class SeatDTO {
	int seat_ID;
	char seat_group;
	int seat_no;
	int seat_line_no;
	int screen_ID;
	int theater_ID;
	
	public SeatDTO(int seat_ID, char seat_group, int seat_no, int seat_line_no, int screen_ID, int theater_ID) {
		this.seat_ID = seat_ID;
		this.seat_group = seat_group;
		this.seat_no = seat_no;
		this.seat_line_no = seat_line_no;
		this.screen_ID = screen_ID;
		this.theater_ID = theater_ID;
	}
	public int getSeat_ID() {
		return seat_ID;
	}
	public void setSeat_ID(int seat_ID) {
		this.seat_ID = seat_ID;
	}
	public char getSeat_group() {
		return seat_group;
	}
	public void setSeat_group(char seat_group) {
		this.seat_group = seat_group;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public int getSeat_line_no() {
		return seat_line_no;
	}
	public void setSeat_line_no(int seat_line_no) {
		this.seat_line_no = seat_line_no;
	}
	public int getScreen_ID() {
		return screen_ID;
	}
	public void setScreen_ID(int screen_ID) {
		this.screen_ID = screen_ID;
	}
	public int getTheater_ID() {
		return theater_ID;
	}
	public void setTheater_ID(int theater_ID) {
		this.theater_ID = theater_ID;
	}
}
