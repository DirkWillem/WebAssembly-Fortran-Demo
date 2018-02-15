FUNCTION dy(t, y)
    IMPLICIT NONE

    REAL :: dy
    REAL :: y
    REAL :: t

    REAL, PARAMETER :: e = 2.71828

    dy = (5 * t * t - y) / ( e ** (t + y ))
    RETURN
END FUNCTION dy

SUBROUTINE RK4(t, y)
    IMPLICIT NONE

    INTERFACE
        FUNCTION dy(t, y)
            REAL :: dy
            REAL, INTENT(IN) :: y
            REAL, INTENT(IN) :: t
        END FUNCTION dy
    END INTERFACE

    INTEGER :: i
    REAL, PARAMETER :: y0 = 1, h = 0.1
    REAL, DIMENSION(4), PARAMETER :: Fscheme = (/ 1, 2, 2, 1 /)
    REAl, DIMENSION(101), INTENT(OUT) :: t, y
    REAL, DIMENSION(4) :: F

    t(1) = 0
    y(1) = y0

    DO i = 1,100,1
        F(1) = h * dy(t(i), y(i))
        F(2) = h * dy(t(i) + h/2, y(i) + F(1)/2)
        F(3) = h * dy(t(i) + h/2, y(i) + F(2)/2)
        F(4) = h * dy(t(i) + h, y(i) + F(3))

        t(i+1) = i * h
        y(i+1) = y(i) + DOT_PRODUCT(F, Fscheme) / 6
    END DO
END SUBROUTINE RK4