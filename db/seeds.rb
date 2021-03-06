# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 users = [
 User.create(email: "ana@catteam.com", password: "ana"),
 User.create(email: "delmar@catteam.com", password: "delmar"),
 User.create(email: "patricia@catteam.com", password: "patricia")
 ];
skills = [
Skill.create(name:"css"),
Skill.create(name:"ruby"),
Skill.create(name:"js"),
Skill.create(name:"html"),
Skill.create(name:"animation")
];

members = [
Member.create(name: "Ana", dayshift: true, availability: true, email: "ana@catteam.com", avatar: File.open(Rails.root.join("db/seeds/ana.jpg"))), 
Member.create(name: "Clara", dayshift: false, availability: true, email: "clara@catteam.com", avatar: File.open(Rails.root.join("db/seeds/clara.png"))), 
Member.create(name: "Delmar", dayshift: true, availability: true, email: "delmar@catteam.com", avatar: File.open(Rails.root.join("db/seeds/delmar.jpg"))), 
Member.create(name: "John", dayshift: false, availability: true, email: "john@catteam.com", avatar: File.open(Rails.root.join("db/seeds/john.png"))), 
Member.create(name: "Patricia", dayshift: true, availability: true, email: "patricia@catteam.com",avatar: File.open(Rails.root.join("db/seeds/patricia.jpg"))),
Member.create(name: "Peter", dayshift: true, availability: true, email: "peter@catteam.com",project_id: 3,avatar: File.open(Rails.root.join("db/seeds/peter.png")))
];

projects = [
Project.create(name: "Creator School", description: "Become a super hero developer with us", duration:1),
Project.create(name: "First job", description: "Create a super website with full database", duration:2),
Project.create(name: "Job app", description: "Code like a zombie on rails developer", duration:4)
];



memberskills = [
MemberSkill.create(member_id: members[0].id, skill_id: skills[1].id),
MemberSkill.create(member_id: members[0].id, skill_id: skills[4].id),
MemberSkill.create(member_id: members[1].id, skill_id: skills[0].id),
MemberSkill.create(member_id: members[1].id, skill_id: skills[2].id),
MemberSkill.create(member_id: members[2].id, skill_id: skills[3].id),
MemberSkill.create(member_id: members[2].id, skill_id: skills[1].id),
MemberSkill.create(member_id: members[2].id, skill_id: skills[1].id),
MemberSkill.create(member_id: members[3].id, skill_id: skills[1].id),
MemberSkill.create(member_id: members[3].id, skill_id: skills[4].id),
MemberSkill.create(member_id: members[4].id, skill_id: skills[0].id),
MemberSkill.create(member_id: members[4].id, skill_id: skills[2].id),
MemberSkill.create(member_id: members[5].id, skill_id: skills[3].id),
MemberSkill.create(member_id: members[5].id, skill_id: skills[1].id),
MemberSkill.create(member_id: members[5].id, skill_id: skills[1].id)
];

projectskills = [
ProjectSkill.create(project_id: projects[0].id, skill_id: skills[0].id),
ProjectSkill.create(project_id: projects[0].id, skill_id: skills[1].id),
ProjectSkill.create(project_id: projects[0].id, skill_id: skills[3].id),
ProjectSkill.create(project_id: projects[1].id, skill_id: skills[0].id),
ProjectSkill.create(project_id: projects[2].id, skill_id: skills[1].id),
ProjectSkill.create(project_id: projects[2].id, skill_id: skills[2].id)
];
