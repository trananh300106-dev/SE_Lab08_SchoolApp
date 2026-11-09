using System.ComponentModel.DataAnnotations.Schema;

namespace SchoolAppCoreRazor.Models;

public class Enrollment
{
    public int EnrollmentID { get; set; }
    public int CourseID { get; set; }
    public int StudentID { get; set; }

    [Column(TypeName = "decimal(4,2)")]
    public decimal Grade { get; set; }

    public Course? Course { get; set; }
    public Student? Student { get; set; }
}