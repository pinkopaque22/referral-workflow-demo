====Referral Workflow Demo====

This is a simple Ruby on Rails 8 application demonstrating a student behavioral health referral workflow for demo purposes. It is intended to showcase basic Rails features, PostgreSQL integration, and role-based workflows.

====Ruby Version====
- Ruby 3.2.4

====Rails Version====
- Rails 8.x

====System Dependencies====
- PostgreSQL (v13 recommended)
- Node.js (for JS features if needed)
- Yarn (optional, for JS dependencies)
- Git (for version control)

====Database Setup====

This project uses **PostgreSQL**. For local development:
1. Make sure PostgreSQL is installed and running:
<bash>
brew services start postgresql@13

2. Set Environment Variables

Set your local PostgreSQL username and password so Rails can connect:
export PGUSER=your_postgres_username
export PGPASSWORD=your_postgres_password
(Replace your_postgres_username and your_postgres_password with your actual credentials.)

3. Create, Migrate, and Seed the Database

This will set up the schema and initial demo data:
rails db:create
rails db:migrate
rails db:seed

4. Running the App Locally

Start the Rails server:
bin/rails server

Open your browser and go to:
http://localhost:3000  # /referrals
You should now be able to interact with the demo workflow.

====User Roles & Permissions====

=Teacher=
Submit student referrals

=Admin / County Admin=
Review referrals
Approve and add signature

=Counselor=
View assigned referrals
Log follow-ups and contact attempts

====Referral Workflow Summary====

- Teacher submits a referral for a student.
- Admin reviews, approves, and signs the referral.
- Counselor monitors progress and logs actions.

====Frontend / JavaScript (Rails 8 Notes)====

- Rails 8 has moved away from Webpacker:
- Small demo projects: Use Importmaps (with Turbo & Stimulus) — already included in this project.
- Larger projects: Use jsbundling-rails with esbuild, webpack, or rollup for modern JS tooling.

====Notes====

- All database references use PostgreSQL.
- Demo is designed for local development and easy collaboration:
- Other collaborators just need to set their PGUSER and PGPASSWORD.
- They can pull the repo, run rails db:create db:migrate db:seed, and the app will work immediately.
- This is a minimal demo, but structured to allow adding features later (e.g., conditional fields   per role, e-signature workflows, or additional reporting dashboards).

====Optional Enhancements (Future Work)====

- Signature workflow gem for Admin approvals
- Conditional form fields depending on the logged-in user
- Audit logging for each referral
- Turbo/Stimulus interactive forms
