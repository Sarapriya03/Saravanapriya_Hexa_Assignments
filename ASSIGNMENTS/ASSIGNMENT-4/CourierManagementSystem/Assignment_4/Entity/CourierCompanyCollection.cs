using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



using CourierManagementSystem.Entity;

namespace CourierManagementSystem.Entity
{
    public class CourierCompanyCollection
    {
        private string _companyName;
        private List<Courier> _courierDetails;
        private List<Employee> _employeeDetails;
        private List<Location> _locationDetails;
        private CourierCompanyCollection companyObj;
        private string v;
        private List<Courier> couriers;
        private List<Employee> employees;
        private List<Location> locations;

        public CourierCompanyCollection()
        {
            _companyName = string.Empty;
            _courierDetails = new List<Courier>();
            _employeeDetails = new List<Employee>();
            _locationDetails = new List<Location>();
        }

        public CourierCompanyCollection(CourierCompanyCollection companyObj)
        {
            this.companyObj = companyObj;
        }

        public CourierCompanyCollection(string v, List<Courier> couriers, List<Employee> employees, List<Location> locations)
        {
            this.v = v;
            this.couriers = couriers;
            this.employees = employees;
            this.locations = locations;
        }

        public CourierCompanyCollection(string companyName, List<Courier> courierDetails,
            List<Employee> employeeDetails, List<User> users, List<Location> locationDetails)
        {
            _companyName = companyName ?? throw new ArgumentNullException(nameof(companyName));
            _courierDetails = courierDetails ?? new List<Courier>();
            _employeeDetails = employeeDetails ?? new List<Employee>();
            _locationDetails = locationDetails ?? new List<Location>();
        }

        public string CompanyName
        {
            get => _companyName;
            set => _companyName = value ?? throw new ArgumentNullException(nameof(CompanyName));
        }

        public List<Courier> CourierDetails
        {
            get => _courierDetails;
            set => _courierDetails = value ?? new List<Courier>();
        }

        public List<Employee> EmployeeDetails
        {
            get => _employeeDetails;
            set => _employeeDetails = value ?? new List<Employee>();
        }

        public List<Location> LocationDetails
        {
            get => _locationDetails;
            set => _locationDetails = value ?? new List<Location>();
        }

        public override string ToString()
        {
            return $"CourierCompanyCollection [CompanyName={_companyName}, " +
                   $"CourierCount={_courierDetails.Count}, EmployeeCount={_employeeDetails.Count}, " +
                   $"LocationCount={_locationDetails.Count}]";
        }
    }
}
