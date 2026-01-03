-- MonnyCreaX Website Database - Complete Seed Data
-- SQL Schema and Complete Data for All Website Content
-- Created: 2026
-- Contact: monnybethwel@gmail.com | WhatsApp: +254758434092

-- ============================================
-- SITE METADATA
-- ============================================
CREATE TABLE IF NOT EXISTS site_metadata (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand_name TEXT NOT NULL,
    tagline TEXT NOT NULL,
    founder_name TEXT NOT NULL,
    founder_title TEXT NOT NULL,
    location TEXT NOT NULL,
    email TEXT NOT NULL,
    whatsapp TEXT NOT NULL,
    instagram TEXT NOT NULL,
    linkedin TEXT,
    working_hours_weekdays TEXT,
    working_hours_saturday TEXT,
    working_hours_sunday TEXT,
    serving_clients TEXT,
    copyright_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO site_metadata (brand_name, tagline, founder_name, founder_title, location, email, whatsapp, instagram, working_hours_weekdays, working_hours_saturday, working_hours_sunday, serving_clients, copyright_text) VALUES
('MonnyCreaX', 'Where Clarity Meets Creativity', 'Bethwel Monny', 'Brand Strategist', 'Nairobi, Kenya', 'monnybethwel@gmail.com', '+254758434092', '@monnycreax', 'Monday - Friday: 9:00 AM - 6:00 PM (EAT)', 'Limited availability', 'Closed', 'East Africa, Africa, and globally (English-speaking)', '© 2026 MonnyCreaX. All rights reserved.');

-- ============================================
-- PAGES
-- ============================================
CREATE TABLE IF NOT EXISTS pages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    page_slug TEXT UNIQUE NOT NULL,
    page_title TEXT NOT NULL,
    meta_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO pages (page_slug, page_title, meta_description) VALUES
('homepage', 'MonnyCreaX - Brand Strategy & Direction', 'Brand strategy and direction for founders, speakers, and thought leaders. MonnyCreaX helps you turn scattered ideas into clear, credible brands through strategic clarity.'),
('about', 'About Bethwel Monny - MonnyCreaX', 'Meet Bethwel Monny, brand strategist and founder of MonnyCreaX. Helping African leaders build brands that make sense through strategy-first approach.'),
('services', 'Services - Brand Strategy & Clarity | MonnyCreaX', 'Brand Clarity Intensive, Strategy Retainers, and Brand Audits for leaders ready to move from confusion to clarity. Based in Nairobi, serving clients globally.'),
('process', 'Our Process - How We Work | MonnyCreaX', 'From first contact to final delivery, here''s exactly what to expect when working with MonnyCreaX for brand strategy and clarity.'),
('portfolio', 'Portfolio & Case Studies | MonnyCreaX', 'Real transformations and results from brand strategy work with founders, speakers, and thought leaders.'),
('contact', 'Contact MonnyCreaX - Let''s Talk About Your Brand', 'Ready to clarify your brand? Book a Brand Clarity Intensive or get in touch with Bethwel Monny at MonnyCreaX. Serving founders, speakers, and thought leaders.'),
('faq', 'Frequently Asked Questions | MonnyCreaX', 'Common questions about brand strategy services, process, pricing, and working with MonnyCreaX.');

-- ============================================
-- SECTIONS (Page Content Sections)
-- ============================================
CREATE TABLE IF NOT EXISTS sections (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    page_id INTEGER NOT NULL,
    section_type TEXT NOT NULL,
    section_key TEXT NOT NULL,
    headline TEXT,
    subheadline TEXT,
    body TEXT,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (page_id) REFERENCES pages(id)
);

-- Homepage Sections
INSERT INTO sections (page_id, section_type, section_key, headline, subheadline, body, display_order) VALUES
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'hero', 'hero', 'Turn Scattered Ideas Into Clear, Credible Brands', 'Brand strategy and direction for founders, speakers, and thought leaders who are ready to stop guessing and start growing.', 'You have strong ideas. You work hard. You show up consistently. But your message feels scattered, people engage but don''t convert, and you''re explaining yourself over and over without clarity.\n\nThat ends here.', 1),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'about', 'about', 'Strategy Before Aesthetics. Clarity Before Creativity.', NULL, 'I''m Bethwel Monny, a brand strategist who helps leaders build brands that don''t just look good—they make sense.\n\nAt MonnyCreaX, I don''t start with logos or colors. I start with the hard questions: Who are you? What do you stand for? Why should anyone care?\n\nBecause beautiful design without strategic foundation is just decoration. And your brand deserves more than that.\n\nAfrican creativity meets global strategy. Purpose-driven branding for leaders who are ready to communicate with confidence.', 2),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'problem', 'problem', 'Does This Sound Like You?', NULL, 'If you recognize yourself here, it''s not a creativity problem. It''s a clarity problem.', 3),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'solution', 'solution', 'What I Do (And How I''m Different)', NULL, 'I help founders, speakers, and thought leaders define their brand essence, clarify their positioning, and build strategic direction—so they can communicate with confidence and grow with intention.', 4),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'how_it_works', 'how_it_works', 'The MonnyCreaX Process', NULL, NULL, 5),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'services_overview', 'services_overview', 'How We Can Work Together', NULL, NULL, 6),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'social_proof', 'social_proof', 'What Clients Say', NULL, NULL, 7),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'cta', 'cta', 'Ready to Get Clear?', NULL, 'Stop guessing. Stop explaining. Stop feeling scattered.\n\nLet''s build a brand that makes sense—to you, to your audience, and to your future.', 8);

-- About Page Sections
INSERT INTO sections (page_id, section_type, section_key, headline, subheadline, body, display_order) VALUES
((SELECT id FROM pages WHERE page_slug = 'about'), 'hero', 'hero', 'I''m Bethwel Monny', 'Brand Strategist. Creative Director. Clarity Builder.', NULL, 1),
((SELECT id FROM pages WHERE page_slug = 'about'), 'story', 'story', 'The Story Behind MonnyCreaX', NULL, 'MonnyCreaX began with a simple realization: most brands don''t fail because they lack creativity. They fail because they lack clarity.\n\nI''ve spent years working with founders, speakers, ministry leaders, and entrepreneurs—all brilliant people with powerful ideas. But too many of them were invisible, not because they weren''t talented, but because they couldn''t articulate who they were or why anyone should care.\n\nThat''s what I fix.\n\nI''m not here to make your brand "pretty." I''m here to make it make sense. To help you define your positioning, clarify your messaging, and build strategic direction so you can grow with confidence—not confusion.\n\nI believe African creativity doesn''t need to imitate the West. We have our own voice, our own stories, our own strategic intelligence. My work is about translating that authenticity into brands that command respect globally.\n\nStrategy first. Design second. Purpose always.', 2),
((SELECT id FROM pages WHERE page_slug = 'about'), 'approach', 'approach', 'How I Work', NULL, 'I don''t start with aesthetics. I start with questions.\n\nMost designers skip these. I don''t. Because without strategic clarity, even the most beautiful brand is just decoration.', 3),
((SELECT id FROM pages WHERE page_slug = 'about'), 'values', 'values', 'What I Stand For', NULL, NULL, 4),
((SELECT id FROM pages WHERE page_slug = 'about'), 'background', 'background', 'My Background', NULL, 'I''m based in Nairobi, Kenya, and I work with clients across East Africa and globally.\n\nI''ve worked with:\n- Startup founders building their first brand\n- Established speakers repositioning for growth\n- Ministry leaders clarifying their message\n- Entrepreneurs scaling beyond their current identity\n\nEvery project is different, but the need is always the same: clarity.', 5),
((SELECT id FROM pages WHERE page_slug = 'about'), 'why', 'why', 'Why Work With Me?', NULL, NULL, 6),
((SELECT id FROM pages WHERE page_slug = 'about'), 'cta', 'cta', 'Let''s Work Together', 'If you''re ready to move from confusion to clarity, from scattered to strategic, let''s talk.', NULL, 7);

-- Process Page Sections
INSERT INTO sections (page_id, section_type, section_key, headline, subheadline, body, display_order) VALUES
((SELECT id FROM pages WHERE page_slug = 'process'), 'hero', 'hero', 'How We Work Together', 'From first contact to final delivery, here''s exactly what to expect.', NULL, 1),
((SELECT id FROM pages WHERE page_slug = 'process'), 'what_next', 'what_next', 'What Happens Next?', NULL, 'Most clients then:\n- Update all profiles with new messaging\n- Hire a designer for visual execution (I can recommend)\n- Launch content using the messaging framework\n- Book ongoing retainer support\n- Implement with confidence and momentum', 6);

-- Portfolio Page Sections
INSERT INTO sections (page_id, section_type, section_key, headline, subheadline, body, display_order) VALUES
((SELECT id FROM pages WHERE page_slug = 'portfolio'), 'header', 'header', 'Work & Impact', 'Real transformations. Real results.', NULL, 1);

-- Contact Page Sections
INSERT INTO sections (page_id, section_type, section_key, headline, subheadline, body, display_order) VALUES
((SELECT id FROM pages WHERE page_slug = 'contact'), 'hero', 'hero', 'Let''s Talk About Your Brand', 'Ready to move from confusion to clarity? Start here.', NULL, 1),
((SELECT id FROM pages WHERE page_slug = 'contact'), 'office_hours', 'office_hours', 'Office Hours & Availability', NULL, 'Working Hours:\nMonday - Friday: 9:00 AM - 6:00 PM (EAT)\nSaturday: Limited availability\nSunday: Closed\n\nBased in: Nairobi, Kenya\n\nServing clients: East Africa, Africa, and globally (English-speaking)', 3),
((SELECT id FROM pages WHERE page_slug = 'contact'), 'booking', 'booking', 'Book a Free 15-Minute Consultation', 'Not sure which service you need? Let''s hop on a quick call to discuss your challenge and see if we''re a good fit.', NULL, 4);

-- ============================================
-- PROBLEM STATEMENTS (Homepage)
-- ============================================
CREATE TABLE IF NOT EXISTS problem_statements (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    page_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (page_id) REFERENCES pages(id)
);

INSERT INTO problem_statements (page_id, title, description, display_order) VALUES
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'You''re Active But Not Effective', 'You post consistently, show up online, and work hard—but nothing''s converting. Your brand looks busy but feels scattered.', 1),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'You Explain Yourself Repeatedly', 'Every conversation, you''re re-explaining your vision. Your message changes depending on who''s asking. There''s no clarity, no consistency.', 2),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'You''re Ready to Scale But Your Brand Won''t Support It', 'You have the talent, the vision, and the work ethic. But your brand identity can''t carry the growth you''re building toward.', 3);

-- ============================================
-- SOLUTION PILLARS (Homepage)
-- ============================================
CREATE TABLE IF NOT EXISTS solution_pillars (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    page_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (page_id) REFERENCES pages(id)
);

INSERT INTO solution_pillars (page_id, title, description, display_order) VALUES
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'Strategy First', 'Every brand starts with clarity. I ask the hard questions, define your positioning, and build the strategic foundation everything else rests on.', 1),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'Messaging That Lands', 'Your audience doesn''t need to be convinced you''re creative. They need to understand what you do, who it''s for, and why it matters—in 5 seconds.', 2),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'Direction You Can Implement', 'You don''t just get a document. You get a roadmap, frameworks, and the confidence to show up consistently without second-guessing every decision.', 3);

-- ============================================
-- HOW IT WORKS STEPS (Homepage)
-- ============================================
CREATE TABLE IF NOT EXISTS how_it_works_steps (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    page_id INTEGER NOT NULL,
    step_number INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (page_id) REFERENCES pages(id)
);

INSERT INTO how_it_works_steps (page_id, step_number, title, description, display_order) VALUES
((SELECT id FROM pages WHERE page_slug = 'homepage'), 1, 'Book Your Session', 'Choose the Brand Clarity Intensive that fits your needs. We''ll schedule a time that works for you.', 1),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 2, 'Complete Intake', 'Fill out a detailed intake form so I understand your brand, challenges, and vision before we meet.', 2),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 3, 'The Intensive (3-4 Hours)', 'We work through discovery, positioning, messaging, and strategic direction in one focused session.', 3),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 4, 'Receive Your Blueprint', 'Within 3-5 days, you get a comprehensive Brand Clarity Blueprint with everything documented, plus a follow-up strategy call.', 4);

-- ============================================
-- SERVICES
-- ============================================
CREATE TABLE IF NOT EXISTS services (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    service_slug TEXT UNIQUE NOT NULL,
    title TEXT NOT NULL,
    tagline TEXT,
    overview TEXT,
    investment_min TEXT,
    investment_max TEXT,
    timeline TEXT,
    commitment TEXT,
    availability TEXT,
    display_order INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO services (service_slug, title, tagline, overview, investment_min, investment_max, timeline, commitment, availability, display_order) VALUES
('intensive', 'Brand Clarity Intensive', 'Stop guessing. Start growing.', 'A focused, strategic session where we define your brand positioning, messaging, and direction in one concentrated experience. You walk away with complete clarity and a roadmap to implement it.', '$500', '$1,200', '2-3 weeks from booking to completion', NULL, NULL, 1),
('retainer', 'Brand Strategy Retainer', 'Ongoing strategic guidance for growing brands.', 'Monthly strategic partnership for leaders who need consistent brand direction, not just one-time clarity. Perfect for brands in growth mode or launching new initiatives.', '$1,500', '$2,000', NULL, '3 months minimum', 'Limited to 3 retainer clients at a time', 2),
('audit', 'Brand Audit & Consultation', 'Quick strategic feedback without full intensive.', 'A diagnostic review of your brand with strategic recommendations. Perfect for leaders wanting external perspective or testing the waters before a full intensive.', '$300', '$400', '3-5 days after receiving materials', NULL, NULL, 3);

-- Service Who It's For
CREATE TABLE IF NOT EXISTS service_target_audience (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    service_id INTEGER NOT NULL,
    audience_text TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (service_id) REFERENCES services(id)
);

INSERT INTO service_target_audience (service_id, audience_text, display_order) VALUES
((SELECT id FROM services WHERE service_slug = 'intensive'), 'Founders with strong ideas but unclear messaging', 1),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'Speakers building authority and credibility', 2),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'Thought leaders ready to scale', 3),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'Ministry leaders whose vision isn''t translating', 4),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'Entrepreneurs who''ve outgrown their current brand', 5),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'Clients who completed an intensive and want ongoing support', 1),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'Growing organizations needing consistent strategic input', 2),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'Leaders launching quarterly initiatives', 3),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'Brands in active growth phase', 4),
((SELECT id FROM services WHERE service_slug = 'audit'), 'Brands needing specific feedback, not full strategy', 1),
((SELECT id FROM services WHERE service_slug = 'audit'), 'Organizations wanting external audit', 2),
((SELECT id FROM services WHERE service_slug = 'audit'), 'Leaders considering full intensive but want to start smaller', 3),
((SELECT id FROM services WHERE service_slug = 'audit'), 'Quick wins before bigger engagement', 4);

-- Service Features
CREATE TABLE IF NOT EXISTS service_features (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    service_id INTEGER NOT NULL,
    feature_category TEXT NOT NULL,
    feature_text TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (service_id) REFERENCES services(id)
);

-- Brand Clarity Intensive Features
INSERT INTO service_features (service_id, feature_category, feature_text, display_order) VALUES
((SELECT id FROM services WHERE service_slug = 'intensive'), 'during_session', 'Brand essence & positioning defined', 1),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'during_session', 'Audience mapping and insights', 2),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'during_session', 'Complete messaging framework', 3),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'during_session', 'Visual direction brief', 4),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'during_session', '60-day implementation roadmap', 5),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'after_session', 'Brand Clarity Blueprint (PDF, 15-25 pages)', 1),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'after_session', 'All frameworks documented', 2),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'after_session', 'Strategic recommendations', 3),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'after_session', 'Resource list and next steps', 4),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'follow_up', '1-hour strategy call', 1),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'follow_up', 'Questions answered', 2),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'follow_up', 'Implementation guidance', 3),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'follow_up', 'Confidence boost', 4);

-- Brand Strategy Retainer Features
INSERT INTO service_features (service_id, feature_category, feature_text, display_order) VALUES
((SELECT id FROM services WHERE service_slug = 'retainer'), 'monthly', '2 strategy sessions (60 minutes each)', 1),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'monthly', 'Unlimited email/WhatsApp support', 2),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'monthly', 'Brand asset review and feedback', 3),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'monthly', 'Content direction and planning', 4),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'monthly', 'Messaging refinement', 5),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'monthly', 'Decision-making support', 6),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'quarterly_bonus', 'Comprehensive brand audit', 1),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'quarterly_bonus', 'Updated positioning documents', 2),
((SELECT id FROM services WHERE service_slug = 'retainer'), 'quarterly_bonus', 'Strategic planning session', 3);

-- Brand Audit Features
INSERT INTO service_features (service_id, feature_category, feature_text, display_order) VALUES
((SELECT id FROM services WHERE service_slug = 'audit'), 'what_you_get', 'Review of all brand touchpoints', 1),
((SELECT id FROM services WHERE service_slug = 'audit'), 'what_you_get', 'Messaging analysis', 2),
((SELECT id FROM services WHERE service_slug = 'audit'), 'what_you_get', 'Visual identity assessment', 3),
((SELECT id FROM services WHERE service_slug = 'audit'), 'what_you_get', 'Competitor positioning review', 4),
((SELECT id FROM services WHERE service_slug = 'audit'), 'what_you_get', 'Strategic recommendations (5-10 page report)', 5),
((SELECT id FROM services WHERE service_slug = 'audit'), 'what_you_get', '30-minute feedback call', 6);

-- Service Pricing Tiers
CREATE TABLE IF NOT EXISTS service_pricing_tiers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    service_id INTEGER NOT NULL,
    tier_name TEXT NOT NULL,
    price TEXT NOT NULL,
    description TEXT,
    best_for TEXT,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (service_id) REFERENCES services(id)
);

INSERT INTO service_pricing_tiers (service_id, tier_name, price, description, best_for, display_order) VALUES
((SELECT id FROM services WHERE service_slug = 'intensive'), 'Rapid Intensive', '$500', 'Streamlined session, essential clarity document, 30-day roadmap, 30-minute follow-up call.', 'Solo founders, tight budgets, focused scope.', 1),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'Standard Intensive', '$750', 'Full 3-4 hour session, complete Brand Clarity Blueprint, 60-day roadmap, 1-hour follow-up, 14 days support.', 'Most clients seeking comprehensive clarity.', 2),
((SELECT id FROM services WHERE service_slug = 'intensive'), 'Premium Intensive', '$1,200', 'Extended 5-hour session, complete blueprint, 3 monthly check-ins, basic visual mockups, social profile optimization, priority support.', 'Leaders ready for immediate implementation with ongoing guidance.', 3);

-- Add-On Services
CREATE TABLE IF NOT EXISTS addon_services (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    investment TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO addon_services (title, description, investment, display_order) VALUES
('Speaking & Workshops', 'Brand strategy talks and workshops for teams, conferences, and organizations.', 'Custom pricing based on scope', 1),
('Execution Support', 'Logo design, brand guidelines, website design—after strategy is complete.', 'Quoted separately', 2),
('Rush Service', 'Need clarity fast? Rush delivery available for 25% additional fee.', '25% additional fee', 3);

-- ============================================
-- PROCESS PHASES & STEPS
-- ============================================
CREATE TABLE IF NOT EXISTS process_phases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    phase_number INTEGER NOT NULL,
    phase_title TEXT NOT NULL,
    phase_description TEXT,
    display_order INTEGER DEFAULT 0
);

INSERT INTO process_phases (phase_number, phase_title, phase_description, display_order) VALUES
(1, 'Phase 1: Inquiry to Booking', NULL, 1),
(2, 'Phase 2: Preparation', NULL, 2),
(3, 'Phase 3: The Intensive Session', NULL, 3),
(4, 'Phase 4: Blueprint Delivery', 'Within 3-5 Days: You receive your Brand Clarity Blueprint—a comprehensive PDF with all frameworks, strategic recommendations, and implementation guidance.', 4),
(5, 'Phase 5: Follow-Up & Support', NULL, 5);

CREATE TABLE IF NOT EXISTS process_steps (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    phase_id INTEGER NOT NULL,
    step_number INTEGER,
    step_title TEXT NOT NULL,
    step_description TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (phase_id) REFERENCES process_phases(id)
);

-- Phase 1 Steps
INSERT INTO process_steps (phase_id, step_number, step_title, step_description, display_order) VALUES
((SELECT id FROM process_phases WHERE phase_number = 1), 1, 'Initial Contact', 'You DM "CLARITY" on Instagram, email me, or fill out the contact form. I respond within 4 hours.', 1),
((SELECT id FROM process_phases WHERE phase_number = 1), 2, 'Quick Qualification Chat (15 min)', 'We hop on a brief call to ensure we''re a good fit. I ask about your challenge, timeline, and goals.', 2),
((SELECT id FROM process_phases WHERE phase_number = 1), 3, 'Proposal & Payment', 'I send you the service details and pricing. You choose your tier, I send an invoice, and once payment is received, we book your session date.', 3);

-- Phase 2 Steps
INSERT INTO process_steps (phase_id, step_number, step_title, step_description, display_order) VALUES
((SELECT id FROM process_phases WHERE phase_number = 2), 1, 'Intake Form (You complete)', 'Within 24-48 hours of booking, you fill out a detailed intake form about your brand, challenges, and vision.', 1),
((SELECT id FROM process_phases WHERE phase_number = 2), 2, 'My Pre-Work (I do this)', 'I review your intake, audit your online presence, research competitors, and prepare strategic questions.', 2),
((SELECT id FROM process_phases WHERE phase_number = 2), 3, 'Confirmation Email', 'I send session details, meeting link, and set clear expectations so you know exactly what to prepare.', 3);

-- Phase 3 Steps
INSERT INTO process_steps (phase_id, step_number, step_title, step_description, display_order) VALUES
((SELECT id FROM process_phases WHERE phase_number = 3), 1, 'Hour 1: Discovery', 'We dive deep into your story, vision, and what makes you unique. I ask hard questions. You get honest about where you are.', 1),
((SELECT id FROM process_phases WHERE phase_number = 3), 2, 'Hour 2: Definition', 'We craft your positioning statement, build your messaging framework, and define your brand voice.', 2),
((SELECT id FROM process_phases WHERE phase_number = 3), 3, 'Hour 3: Direction', 'We explore visual direction, map content themes, and create your communication strategy.', 3),
((SELECT id FROM process_phases WHERE phase_number = 3), 4, 'Hour 4: Implementation', 'We build your 60-day roadmap, prioritize quick wins, and ensure you leave with confidence and clarity.', 4);

-- Phase 5 Steps
INSERT INTO process_steps (phase_id, step_number, step_title, step_description, display_order) VALUES
((SELECT id FROM process_phases WHERE phase_number = 5), NULL, '1-2 Weeks Later', 'We hop on a 1-hour call to review your progress, answer questions, and refine anything that needs adjustment.', 1),
((SELECT id FROM process_phases WHERE phase_number = 5), NULL, 'Ongoing', 'You have email support for the agreed period (7-14 days depending on tier).', 2);

-- ============================================
-- FAQ
-- ============================================
CREATE TABLE IF NOT EXISTS faq_categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT UNIQUE NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO faq_categories (category_name, display_order) VALUES
('General Questions', 1),
('Service-Specific Questions', 2),
('Process Questions', 3),
('Investment Questions', 4);

CREATE TABLE IF NOT EXISTS faq_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_id INTEGER NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES faq_categories(id)
);

-- General Questions
INSERT INTO faq_items (category_id, question, answer, display_order) VALUES
((SELECT id FROM faq_categories WHERE category_name = 'General Questions'), 'What makes you different from other brand designers?', 'I''m not a brand designer—I''m a brand strategist. I don''t start with logos or colors. I start with clarity: Who are you? What do you stand for? Who are you speaking to? Design comes after strategy, not before.', 1),
((SELECT id FROM faq_categories WHERE category_name = 'General Questions'), 'Do you work with clients outside Kenya?', 'Yes. All sessions are virtual, and I work with clients across Africa and globally.', 2),
((SELECT id FROM faq_categories WHERE category_name = 'General Questions'), 'How soon can we start?', 'Typically within 1-2 weeks of payment, depending on current availability. I limit intensives to 4 per month to maintain quality.', 3),
((SELECT id FROM faq_categories WHERE category_name = 'General Questions'), 'Do you offer payment plans?', 'For intensives, full payment is required upfront. For retainers, we can discuss monthly billing.', 4);

-- Service-Specific Questions
INSERT INTO faq_items (category_id, question, answer, display_order) VALUES
((SELECT id FROM faq_categories WHERE category_name = 'Service-Specific Questions'), 'What''s included in the Brand Clarity Intensive?', 'A 3-4 hour strategy session, comprehensive Brand Clarity Blueprint (PDF), 60-day implementation roadmap, and a 1-hour follow-up call. Full details on the Services page.', 1),
((SELECT id FROM faq_categories WHERE category_name = 'Service-Specific Questions'), 'What if I need design work after the intensive?', 'Strategy and design are separate. After your intensive, I can recommend excellent designers for execution, or we can discuss design as a separate project.', 2),
((SELECT id FROM faq_categories WHERE category_name = 'Service-Specific Questions'), 'Can I bring team members to the session?', 'Yes, up to 2 additional stakeholders can join at no extra cost. More than that, there''s a small additional fee.', 3),
((SELECT id FROM faq_categories WHERE category_name = 'Service-Specific Questions'), 'What if I''m not satisfied?', 'If you show up prepared, engage honestly, and we still don''t deliver value, I''ll refund 50%. This has never happened.', 4),
((SELECT id FROM faq_categories WHERE category_name = 'Service-Specific Questions'), 'Do you do logo design?', 'Not as my primary service. I focus on strategy and direction. If you need logo design after we clarify your brand, I can recommend talented designers or discuss it as an add-on.', 5);

-- Process Questions
INSERT INTO faq_items (category_id, question, answer, display_order) VALUES
((SELECT id FROM faq_categories WHERE category_name = 'Process Questions'), 'How long does the intensive take?', 'The session itself is 3-4 hours. From booking to final delivery (including follow-up call), plan for 2-3 weeks total.', 1),
((SELECT id FROM faq_categories WHERE category_name = 'Process Questions'), 'What do I need to prepare?', 'Just complete the intake form honestly and show up ready to think deeply about your brand. I handle all the strategic prep.', 2),
((SELECT id FROM faq_categories WHERE category_name = 'Process Questions'), 'Can we split the session into multiple days?', 'Yes, if needed. Some clients prefer 2x 2-hour sessions instead of one 4-hour session.', 3);

-- Investment Questions
INSERT INTO faq_items (category_id, question, answer, display_order) VALUES
((SELECT id FROM faq_categories WHERE category_name = 'Investment Questions'), 'Why are your prices higher than typical designers?', 'Because I''m not selling design hours—I''m selling strategic transformation. Thinking is more valuable than execution. You''re investing in clarity that compounds for years.', 1),
((SELECT id FROM faq_categories WHERE category_name = 'Investment Questions'), 'Do you offer discounts?', 'I occasionally offer early-bird pricing or package deals, but I don''t discount my core services. Quality work requires proper investment.', 2),
((SELECT id FROM faq_categories WHERE category_name = 'Investment Questions'), 'What payment methods do you accept?', 'M-Pesa, bank transfer, PayPal, and Wise for international clients.', 3);

-- ============================================
-- TESTIMONIALS
-- ============================================
CREATE TABLE IF NOT EXISTS testimonials (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    quote TEXT NOT NULL,
    author_name TEXT,
    author_title TEXT,
    author_company TEXT,
    display_order INTEGER DEFAULT 0,
    is_featured BOOLEAN DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO testimonials (quote, author_name, author_title, author_company, display_order, is_featured) VALUES
('Bethwel didn''t just design our brand—he helped us understand who we are. The clarity he brought transformed how we communicate with our audience.', '[Client Name]', '[Title/Company]', NULL, 1, 1),
('Professional, strategic, and incredibly thoughtful. MonnyCreaX delivered beyond our expectations.', '[Client Name]', '[Title/Company]', NULL, 2, 1),
('I went from explaining my business in 10 different ways to having ONE clear message that actually lands.', '[Client Name]', 'Founder', NULL, 3, 1);

-- ============================================
-- CORE VALUES
-- ============================================
CREATE TABLE IF NOT EXISTS core_values (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    value_title TEXT NOT NULL,
    value_description TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO core_values (value_title, value_description, display_order) VALUES
('Authenticity Over Perfection', 'Real beats polished. Your brand should sound like you, not like everyone else.', 1),
('Clarity Over Creativity', 'If it''s beautiful but confusing, it failed. Clarity is the foundation of every strong brand.', 2),
('Strategy Over Speed', 'I don''t rush. I think deeply, ask hard questions, and build foundations that last.', 3),
('Service Over Sales', 'I''m not here to convince you. I''m here to serve leaders who are ready for clarity.', 4),
('Purpose Over Profit', 'This work is ministry, not just business. I''m called to help leaders communicate with confidence.', 5);

-- ============================================
-- ABOUT PAGE QUESTIONS
-- ============================================
CREATE TABLE IF NOT EXISTS approach_questions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_text TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO approach_questions (question_text, display_order) VALUES
('Who are you, really?', 1),
('What do you stand for?', 2),
('Who are you speaking to?', 3),
('What problem do you solve?', 4),
('Why should they choose you?', 5),
('What do you want them to feel?', 6);

-- ============================================
-- WHY MONNYCREAX REASONS
-- ============================================
CREATE TABLE IF NOT EXISTS why_monnycreax (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO why_monnycreax (title, description, display_order) VALUES
('Strategy-First Approach', 'I don''t guess. I research, ask questions, and build strategic foundations before anything visual happens.', 1),
('African Voice, Global Standard', 'I understand both worlds. I help you own your authentic voice while meeting international professional standards.', 2),
('Transformation, Not Transactions', 'I''m not here for quick projects. I''m here for leaders ready to invest in getting it right—once.', 3);

-- ============================================
-- BRAND IDENTITY
-- ============================================
CREATE TABLE IF NOT EXISTS brand_colors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    color_name TEXT NOT NULL,
    hex_code TEXT NOT NULL,
    description TEXT,
    color_type TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO brand_colors (color_name, hex_code, description, color_type, display_order) VALUES
('Deep Charcoal', '#1C1C1C', 'Authority, grounding', 'primary', 1),
('Soft Gold', '#D4AF37', 'Premium, African warmth', 'secondary', 2),
('Clay Beige', '#EAE2D6', 'Organic, approachable', 'tertiary', 3),
('Off White', '#F7F7F4', 'Clean, clarity', 'background', 4),
('Sage Olive', '#8A977B', 'Growth, calm', 'accent', 5);

CREATE TABLE IF NOT EXISTS typography (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    font_name TEXT NOT NULL,
    font_type TEXT NOT NULL,
    usage TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO typography (font_name, font_type, usage, display_order) VALUES
('Playfair Display', 'Serif', 'Headlines', 1),
('Inter', 'Sans-serif', 'Body text', 2),
('DM Sans', 'Sans-serif', 'Body text alternative', 3),
('Space Grotesk', 'Sans-serif', 'Accent text', 4);

-- ============================================
-- CONTACT FORM FIELDS
-- ============================================
CREATE TABLE IF NOT EXISTS contact_form_fields (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    field_name TEXT UNIQUE NOT NULL,
    field_label TEXT NOT NULL,
    field_type TEXT NOT NULL,
    is_required BOOLEAN DEFAULT 0,
    field_options TEXT,
    display_order INTEGER DEFAULT 0
);

INSERT INTO contact_form_fields (field_name, field_label, field_type, is_required, field_options, display_order) VALUES
('name', 'Name', 'text', 1, NULL, 1),
('email', 'Email', 'email', 1, NULL, 2),
('service', 'Service Interested In', 'select', 1, 'Intensive,Retainer,Audit,Not Sure', 3),
('challenge', 'Tell me about your brand challenge', 'textarea', 1, NULL, 4),
('timeline', 'Timeline', 'select', 0, 'Urgent,1-2 weeks,1 month,Just exploring', 5),
('budget', 'Budget Range', 'text', 0, NULL, 6);

-- ============================================
-- CONTACT OPTIONS
-- ============================================
CREATE TABLE IF NOT EXISTS contact_options (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    method TEXT NOT NULL,
    value TEXT NOT NULL,
    instruction TEXT,
    link_url TEXT,
    display_order INTEGER DEFAULT 0
);

INSERT INTO contact_options (title, method, value, instruction, link_url, display_order) VALUES
('Fastest Response', 'Instagram DM', '@monnycreax', 'Send me "CLARITY" and let''s start the conversation.', 'https://instagram.com/monnycreax', 1),
(NULL, 'Email', 'monnybethwel@gmail.com', 'I typically respond within 4-24 hours.', 'mailto:monnybethwel@gmail.com', 2),
('For Serious Inquiries', 'WhatsApp', '+254 758 434 092', 'Business hours: Mon-Fri, 9am-6pm EAT', 'https://wa.me/254758434092', 3);

-- ============================================
-- CTA BUTTONS
-- ============================================
CREATE TABLE IF NOT EXISTS cta_buttons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    button_text TEXT NOT NULL,
    button_type TEXT NOT NULL,
    button_link TEXT NOT NULL,
    cta_category TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO cta_buttons (button_text, button_type, button_link, cta_category, display_order) VALUES
('Book Brand Clarity Intensive', 'primary', '/contact', 'primary', 1),
('Start Here', 'primary', '/contact', 'primary', 2),
('Let''s Get Clear', 'primary', '/contact', 'primary', 3),
('Schedule Consultation', 'primary', '/contact', 'primary', 4),
('Get Started', 'primary', '/contact', 'primary', 5),
('Learn More', 'secondary', '#', 'secondary', 1),
('View Services', 'secondary', '/services', 'secondary', 2),
('Read Case Studies', 'secondary', '/portfolio', 'secondary', 3),
('Send a Message', 'secondary', '/contact', 'secondary', 4),
('Download Guide', 'secondary', '#', 'secondary', 5);

-- ============================================
-- FOOTER LINKS
-- ============================================
CREATE TABLE IF NOT EXISTS footer_links (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    column_title TEXT NOT NULL,
    link_text TEXT NOT NULL,
    link_url TEXT NOT NULL,
    column_number INTEGER NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO footer_links (column_title, link_text, link_url, column_number, display_order) VALUES
('Services', 'Brand Clarity Intensive', '/services#intensive', 2, 1),
('Services', 'Brand Strategy Retainer', '/services#retainer', 2, 2),
('Services', 'Brand Audit & Consultation', '/services#audit', 2, 3),
('Services', 'Speaking & Workshops', '/services#addons', 2, 4),
('Company', 'About', '/about', 3, 1),
('Company', 'Process', '/process', 3, 2),
('Company', 'Portfolio', '/portfolio', 3, 3),
('Company', 'Contact', '/contact', 3, 4),
('Company', 'FAQ', '/faq', 3, 5),
('Connect', 'Instagram: @monnycreax', 'https://instagram.com/monnycreax', 4, 1),
('Connect', 'LinkedIn', '#', 4, 2),
('Connect', 'Email: monnybethwel@gmail.com', 'mailto:monnybethwel@gmail.com', 4, 3),
('Connect', 'WhatsApp: +254 758 434 092', 'https://wa.me/254758434092', 4, 4);

-- ============================================
-- PORTFOLIO CATEGORIES
-- ============================================
CREATE TABLE IF NOT EXISTS portfolio_categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT UNIQUE NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO portfolio_categories (category_name, display_order) VALUES
('Founders & Startups', 1),
('Speakers & Thought Leaders', 2),
('Ministry & Faith-Based', 3),
('Consultants & Coaches', 4),
('Institutions & Organizations', 5);

-- ============================================
-- CASE STUDIES
-- ============================================
CREATE TABLE IF NOT EXISTS case_studies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    client_name TEXT NOT NULL,
    category_id INTEGER,
    challenge TEXT NOT NULL,
    solution TEXT NOT NULL,
    results TEXT NOT NULL,
    testimonial_quote TEXT,
    testimonial_author TEXT,
    testimonial_title TEXT,
    display_order INTEGER DEFAULT 0,
    is_featured BOOLEAN DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES portfolio_categories(id)
);

-- ============================================
-- DECISION TREE (Services Page)
-- ============================================
CREATE TABLE IF NOT EXISTS service_decision_tree (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    service_name TEXT NOT NULL,
    choose_if_text TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO service_decision_tree (service_name, choose_if_text, display_order) VALUES
('Brand Audit', 'You need quick feedback', 1),
('Brand Audit', 'You''re not sure what''s wrong', 2),
('Brand Audit', 'You want to test working together', 3),
('Brand Audit', 'Budget is tight right now', 4),
('Brand Clarity Intensive', 'You need complete strategic clarity', 5),
('Brand Clarity Intensive', 'You''re ready to invest in getting it right', 6),
('Brand Clarity Intensive', 'You want comprehensive frameworks', 7),
('Brand Clarity Intensive', 'You''re serious about growth', 8),
('Brand Strategy Retainer', 'You''ve completed an intensive', 9),
('Brand Strategy Retainer', 'You need ongoing strategic guidance', 10),
('Brand Strategy Retainer', 'You''re in active growth mode', 11),
('Brand Strategy Retainer', 'You value monthly strategic partnership', 12);

-- ============================================
-- INDEXES FOR PERFORMANCE
-- ============================================
CREATE INDEX IF NOT EXISTS idx_pages_slug ON pages(page_slug);
CREATE INDEX IF NOT EXISTS idx_sections_page ON sections(page_id);
CREATE INDEX IF NOT EXISTS idx_services_slug ON services(service_slug);
CREATE INDEX IF NOT EXISTS idx_faq_category ON faq_items(category_id);
CREATE INDEX IF NOT EXISTS idx_process_phase ON process_steps(phase_id);
CREATE INDEX IF NOT EXISTS idx_service_features ON service_features(service_id);
CREATE INDEX IF NOT EXISTS idx_testimonials_featured ON testimonials(is_featured);

-- ============================================
-- END OF DATABASE
-- ============================================

