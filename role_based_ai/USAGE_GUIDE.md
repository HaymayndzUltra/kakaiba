# 🎯 Role-Based AI Framework - Usage Guide

## **📋 OVERVIEW**
This is a clean, organized role-based AI framework with 6 specialized groups and 24 individual AI roles that can be activated via Cursor triggers.

## **🏗️ FRAMEWORK STRUCTURE**

```
role_based_ai/
├── README.md                           # Framework overview
├── master_coordinator.mdc             # Master coordination rules
├── activate_role.py                   # Command activation system
├── USAGE_GUIDE.md                     # This usage guide
├── development/
│   └── development_ai_framework.mdc   # Development AI rules
├── analysis/
│   └── analysis_ai_framework.mdc      # Analysis AI rules
├── security/
│   └── security_ai_framework.mdc      # Security AI rules
├── automation/
│   └── automation_ai_framework.mdc    # Automation AI rules
├── learning/
│   └── learning_ai_framework.mdc      # Learning AI rules
└── coordination/
    └── coordination_ai_framework.mdc  # Coordination AI rules
```

## **🚀 QUICK START**

### **1. List All Available Roles**
```bash
python3 role_based_ai/activate_role.py list
```

### **2. Activate a Specific Role**
```bash
python3 role_based_ai/activate_role.py activate DEV_FULLSTACK
python3 role_based_ai/activate_role.py activate ANALYZE_DATA
python3 role_based_ai/activate_role.py activate SEC_ENGINEER
```

### **3. Show Group Information**
```bash
python3 role_based_ai/activate_role.py group development
python3 role_based_ai/activate_role.py group analysis
```

## **🎯 AVAILABLE AI ROLES**

### **Development AI Group** (6 roles)
- `DEV_FRONTEND` - React, Vue, Angular development
- `DEV_BACKEND` - Node.js, Python, API development
- `DEV_FULLSTACK` - End-to-end development
- `DEV_OPS` - Deployment, CI/CD, infrastructure
- `DEV_REVIEW` - Code quality and best practices
- `DEV_TEST` - Unit, integration, E2E testing

### **Analysis AI Group** (5 roles)
- `ANALYZE_DATA` - Data processing, visualization
- `ANALYZE_BUSINESS` - Requirements, process analysis
- `ANALYZE_RESEARCH` - Technical research, documentation
- `ANALYZE_PERFORMANCE` - System optimization, metrics
- `ANALYZE_QUALITY` - Quality assurance, testing strategies

### **Security AI Group** (4 roles)
- `SEC_ENGINEER` - Security implementation, vulnerability assessment
- `SEC_COMPLIANCE` - Regulatory compliance, audits
- `SEC_RISK` - Risk analysis, mitigation strategies
- `SEC_PENTEST` - Security testing, vulnerability scanning

### **Automation AI Group** (4 roles)
- `AUTO_WORKFLOW` - Process automation, workflow creation
- `AUTO_SCRIPT` - Automation scripts, tools
- `AUTO_OPTIMIZE` - Efficiency improvement, optimization
- `AUTO_INTEGRATE` - System integration, API connections

### **Learning AI Group** (4 roles)
- `LEARN_PATTERN` - Learning from data, identifying patterns
- `LEARN_RULE` - Creating rules from patterns
- `LEARN_ADAPT` - System adaptation, continuous improvement
- `LEARN_KNOWLEDGE` - Knowledge base, documentation

### **Coordination AI Group** (4 roles)
- `COORD_PROJECT` - Project planning, resource management
- `COORD_TEAM` - Team coordination, communication
- `COORD_WORKFLOW` - Process orchestration, handoffs
- `COORD_RESOURCE` - Resource allocation, optimization

## **💡 CURSOR INTEGRATION**

### **How to Use with Cursor:**
1. **Copy the MDC files** to your `.cursor/rules/` directory
2. **Use the triggers** in your Cursor prompts
3. **The system will activate** the appropriate AI role

### **Example Cursor Prompts:**
```
"Create a React e-commerce app" → DEV_FRONTEND
"Analyze our customer data" → ANALYZE_DATA
"Perform security audit" → SEC_ENGINEER
"Automate our deployment" → AUTO_WORKFLOW
"Learn from our project patterns" → LEARN_PATTERN
"Manage our project timeline" → COORD_PROJECT
```

## **🔧 CUSTOMIZATION**

### **Adding New Roles:**
1. **Edit the MDC file** for the appropriate group
2. **Add the role definition** with triggers and capabilities
3. **Update activate_role.py** with the new role information
4. **Test the new role** using the activation system

### **Modifying Existing Roles:**
1. **Edit the MDC file** for the role group
2. **Update the role definition** with new capabilities
3. **Test the modifications** using the activation system

### **Creating New Groups:**
1. **Create a new directory** under `role_based_ai/`
2. **Create the MDC file** with group definitions
3. **Update master_coordinator.mdc** with new group
4. **Update activate_role.py** with new group roles

## **📊 WORKFLOW EXAMPLES**

### **Development Project Workflow:**
```
1. COORD_PROJECT → Project planning
2. ANALYZE_BUSINESS → Requirements analysis
3. DEV_FULLSTACK → Development
4. DEV_TEST → Testing
5. SEC_ENGINEER → Security review
6. COORD_TEAM → Team coordination
```

### **Data Analysis Workflow:**
```
1. ANALYZE_DATA → Data analysis
2. LEARN_PATTERN → Pattern recognition
3. LEARN_RULE → Rule generation
4. AUTO_WORKFLOW → Process automation
5. ANALYZE_QUALITY → Quality assurance
```

### **Security Audit Workflow:**
```
1. SEC_RISK → Risk assessment
2. SEC_PENTEST → Penetration testing
3. SEC_COMPLIANCE → Compliance check
4. SEC_ENGINEER → Security implementation
5. ANALYZE_QUALITY → Quality validation
```

## **🎯 BENEFITS**

### **Specialized Expertise:**
- Each role has specific capabilities and expertise
- Focused on particular aspects of project work
- Deep knowledge in specialized domains

### **Flexible Activation:**
- Activate roles based on project needs
- Switch between roles dynamically
- Combine multiple roles for complex projects

### **Cursor Integration:**
- Seamless integration with Cursor
- Trigger-based activation
- Easy to use and understand

### **Scalable Framework:**
- Easy to add new roles and groups
- Modular design for easy maintenance
- Extensible for future needs

## **🚀 NEXT STEPS**

### **For Immediate Use:**
1. **Copy MDC files** to your Cursor rules directory
2. **Test the activation system** with different roles
3. **Start using triggers** in your Cursor prompts

### **For Customization:**
1. **Modify existing roles** to match your needs
2. **Add new roles** for specific requirements
3. **Create new groups** for specialized domains

### **For Advanced Integration:**
1. **Integrate with external systems** via APIs
2. **Add database storage** for role states
3. **Implement real-time coordination** between roles

## **📞 SUPPORT**

### **Troubleshooting:**
- Check that MDC files are in the correct location
- Verify trigger names are spelled correctly
- Ensure Python script has execute permissions

### **Common Issues:**
- **Role not activating**: Check trigger name and MDC file location
- **Permission errors**: Run `chmod +x activate_role.py`
- **Import errors**: Check Python path and dependencies

This Role-Based AI Framework provides a clean, organized approach to specialized AI coordination that integrates seamlessly with Cursor!
