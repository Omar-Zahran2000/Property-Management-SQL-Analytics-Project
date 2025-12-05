# Property Management SQL Analytics Project

This project analyzes key operational metrics in property management, including rent collection, delinquency, maintenance costs, and vacancy rates. All insights are generated using PostgreSQL queries executed on a sample operational dataset.

---

##  Key Analyses & Insights

### **1. Percent of Rent Collected by Month**
![Percent of Rent Collected by Month](images/rent_collected_by_month.jpg)

**Insight:** Collection performance falls sharply beginning in April (100% → ~65–72%), and July shows 0% collected.  
**Action:** Collections should review delinquent accounts; accounting should verify July posting delays.

---

### **2. Maintenance Cost Share by Category**
![Maintenance Cost Share by Category](images/maintenance_cost_share_by_category.jpg)

**Insight:** Electrical (32.9%) and HVAC (26.8%) account for ~60% of all maintenance spend.  
**Action:** Negotiate vendor rates; implement preventive maintenance to reduce recurring work orders.

---

### **3. Average Rent per Property**
![Average Rent per Property](images/average_rent_per_property.jpg)

**Insight:** Property 3 averages $6,400—significantly lower than others ($7,233–$7,300).  
**Action:** Evaluate pricing strategy, listing quality, and unit condition at Property 3.

---

### **4. Maximum Days Past Due (DPD) Per Lease**
![Max Days Past Due per Lease](images/dpd_max_days_past_due.jpg)

**Insight:** Three leases exceed 500 days past due—extreme delinquency.  
**Action:** Escalate to legal review; audit aging balances for accuracy.

---

### **5. Monthly On-Time Payment Rate**
![On-Time Rent Payment Rate](images/on_time_payment_rate.jpg)

**Insight:** On‑time payments drop to 0% starting in May.  
**Action:** Confirm posting accuracy; implement reminders, late fees, or payment agreements.

---

### **6. Unit Maintenance Cost Ranking**
![Unit Maintenance Cost Ranking](images/unit_cost_ranking.jpg)

**Insight:** Each property has 1–2 units driving the majority of maintenance cost.  
**Action:** Prioritize inspection or capital upgrades for high‑cost units.

---

### **7. Running Total of Payments Per Lease**
![Running Total of Payments per Lease](images/running_total_payments.jpg)

**Insight:** Flat cumulative totals highlight missed or late payments.  
**Action:** Use to detect early delinquency and forecast revenue risks.

---

### **8. Vacancy Rate per Property**
![Vacancy Rate per Property](images/vacancy_rate_per_property.jpg)

**Insight:** Vacancy is 25% across all properties—high and financially impactful.  
**Action:** Review pricing, marketing visibility, and unit turn readiness.

---

##  Files Included
- **README.md** — project explanation and insights  
- **property_management_queries.sql** — all SQL queries used in the analysis  
