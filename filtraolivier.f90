program filtraoli
!Programa que elimina de las secciones de corte
! Todas las lineas de datos que tengan frecuencia absoluta 0.
! y lo escribe en un nuevo archivo.
! Vamos a ponerle lineas en blanco por ahi
! Nomas para que quede compatible con pm3d en gnuplot

implicit none

real*8  ::ina,inb
integer :: inc
integer ::k


open(unit=10,file='echala.in',status='old')
open(unit=12,file='echala.out',status='new')
k=0

1 continue

read(10,*,end=2)ina,inb,inc
if(inc.gt.20)then
   write(12,'(2F10.5, 1I10)')ina,inb,inc
   k=k+1
   if(mod(k,50).eq.0)then
      write(12,*)''
   endif
endif

goto 1



2 continue
 print*, "Ya'stas, Barrabas."

end program filtraoli
