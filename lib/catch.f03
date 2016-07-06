module catch

   implicit none

   interface todo

    integer  :: i_err_no = 5
    character(len=32) :: str_err_No
    character(len=16), parameter :: err_str_No_otag = '<Error_type_No>', err_str_No_ctag='</Error_type_No>'
    character(len=12), parameter :: err_str_where_stag = '<Occurence>', err_str_where_ctag='</Occuence>'
    character(len=13), parameter :: err_str_what_stag='<Error_Text>', err_str_what_ctag='</Error_Text>'
    character(len=7), parameter :: err_str_time_otag='<Time>', err_str_time_ctag='</Time>'
    character(len=10) :: err_str_time
    character(len=128) :: err_str_where
    character(len=1024) :: err_str_what
    public :: err_str_where, err_str_what
    character(len=13) :: err_file = 'Matrix_errors'
    logical :: file_test_exists
    integer :: file_test_size
    character(len=10) :: file_time, file_date
    character(len=24) :: file_new_name
    integer :: file_err_int
    character(len=256) :: file_err_str
    character(len=7180) :: err_out_buffer
    integer :: buff_length
    logical :: err_write = false
        private :: file_test_exists, file_test_size, buff_length

    !log_lvl= 0 > nothing logged
    !       = 1 > only tty
    !       = 2 > only file
    !       = 3 > both (tty & file)
    integer :: log_lvl = 1

    save

contains

    function push_err_out()
     buff_length = len_trim(err_out_buffer)
     if (err_write == true)then
      !"Call an agent we have an error in the Matrix..."
      !~call agent
      err_str_where ='<Modul>catch</Modul><Func>push_err_out</Func>'
      err_str_what ='Possible buffer overflow occured. Agent for investigation called. You will be notified.'
      call tty_log()
     endif
     !todo
     if (len_trim(err_out_buffer)>=5644)then

      call file_out()
     elseif (len_trim(err_out_buffer)<=5644)then


     endif

    end function push_err_out

   character(len=1536) function err_str_f() result(err_out_str)
    implicit none
    call date_and_time(time=err_str_time)
    write(str_err_No,*) i_err_no
    err_out_str = trim(err_str_time_otag)//err_str_time//err_str_time_ctag//err_str_No_otag//str_err_No//err_str_No_ctag
! str_err_No_stag //trim(str_err_No) // err_str_where_stag //'{'//err_str_what//'}'
   end function err_str_f

   subroutine tty_log()

        print *, err_str_time
        print *, err_str_f()
   end subroutine tty_log

   subroutine file_out()

        inquire(file=err_file, exist=file_test_exists, size=file_test_size, iostat=file_err_int, iomsg=file_err_str)
        if(file_err_int /=0) then
          push_err_out()
          open(unit=4, file=err_file,position='append', status='new', action='write', iostat=file_err_int, iomsg=file_err_str)
          if
        elseif(file_test_exists .and.(file_test_size .gt. 1536000)) then
                call date_and_time(date=file_date, time=file_time)
                file_new_name = err_file//file_time//file_date
                call rename(err_file, file_new_name)
                open(unit=4, file=err_file,position='append', status='new', action='write')
                write(4,*) err_str_f()
                close(4)
        elseif (file_test_exists) then
                open(unit=4, file=err_file,position='append',status='old', action='write')
                write(4,*) err_str_f()
                close(4)
        else

            write(4,*) err_str_f()
            i_err_no = 2
            err_str_where='in MODUL catch'
            err_str_what='unable to rename <file>'//err_file//'</file> to <file>'//file_new_name//'</file> <time>'//file_time&
            &//'</time> <date>'//file_date
            call tty_log()
            write(4,*) err_str_f()
            close(4)
        end if

   end subroutine file_out

!"Captains Log. stardate 2435 ..."
   subroutine elog()
    continue
   end subroutine elog



end module catch
