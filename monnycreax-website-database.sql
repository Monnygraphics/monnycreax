-- MonnyCreaX Website Database
-- SQL Schema and Data for Complete Website Content
-- Created: 2026

-- Site Metadata Table
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
    working_hours_weekdays TEXT,
    working_hours_saturday TEXT,
    working_hours_sunday TEXT,
    serving_clients TEXT,
    copyright_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO site_metadata (brand_name, tagline, founder_name, founder_title, location, email, whatsapp, instagram, working_hours_weekdays, working_hours_saturday, working_hours_sunday, serving_clients, copyright_text) VALUES
('MonnyCreaX', 'Where Clarity Meets Creativity', 'Bethwel Monny', 'Brand Strategist', 'Nairobi, Kenya', 'monnybethwel@gmail.com', '+254758434092', '@monnycreax', 'Monday - Friday: 9:00 AM - 6:00 PM (EAT)', 'Limited availability', 'Closed', 'East Africa, Africa, and globally (English-speaking)', '© 2026 MonnyCreaX. All rights reserved.');

-- Pages Table
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

-- Sections Table (for page sections)
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
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'about', 'about', 'Strategy Before Aesthetics. Clarity Before Creativity.', NULL, 'I''m Bethwel Monny, a brand strategist who helps leaders build brands that don''t just look good—they make sense.\n\nAt MonnyCreaX, I don''t start with logos or colors. I start with the hard questions: Who are you? What do you stand for? Why should anyone care?\n\nBecause beautiful design without strategic foundation is just decoration. And your brand deserves more than that.', 2),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'problem', 'problem', 'Does This Sound Like You?', NULL, 'If you recognize yourself here, it''s not a creativity problem. It''s a clarity problem.', 3),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'solution', 'solution', 'What I Do (And How I''m Different)', NULL, 'I help founders, speakers, and thought leaders define their brand essence, clarify their positioning, and build strategic direction—so they can communicate with confidence and grow with intention.', 4),
((SELECT id FROM pages WHERE page_slug = 'homepage'), 'cta', 'cta', 'Ready to Get Clear?', NULL, 'Stop guessing. Stop explaining. Stop feeling scattered.\n\nLet''s build a brand that makes sense—to you, to your audience, and to your future.', 5);

-- Services Table
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

-- Service Pricing Tiers (for Intensive)
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

-- Service Features
CREATE TABLE IF NOT EXISTS service_features (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    service_id INTEGER NOT NULL,
    feature_category TEXT NOT NULL,
    feature_text TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (service_id) REFERENCES services(id)
);

-- Process Phases
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

-- Process Steps
CREATE TABLE IF NOT EXISTS process_steps (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    phase_id INTEGER NOT NULL,
    step_number INTEGER,
    step_title TEXT NOT NULL,
    step_description TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (phase_id) REFERENCES process_phases(id)
);

-- FAQ Categories
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

-- FAQ Items
CREATE TABLE IF NOT EXISTS faq_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_id INTEGER NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    display_order INTEGER DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES faq_categories(id)
);

-- Testimonials
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

-- Core Values
CREATE TABLE IF NOT EXISTS core_values (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    value_title TEXT NOT NULL,
    value_description TEXT NOT NULL,
    display_order INTEGER DEFAULT 0
);

INSERT INTO core_values (value_title, value_description, display_order) VALUES
('Authenticity Over Perfection', 'Real beats polished. Honest beats hyped.', 1),
('Clarity Over Creativity', 'If it''s beautiful but confusing, it failed.', 2),
('Strategy Over Speed', 'Slow, intentional growth beats chaotic hustle.', 3),
('Service Over Sales', 'You help people see clearly. Revenue follows service.', 4),
('Faith & Purpose', 'Your work is ministry, not just business. You''re called to this.', 5);

-- Brand Colors
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

-- Footer Links
CREATE TABLE IF NOT EXISTS footer_links (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    column_title TEXT NOT NULL,
    link_text TEXT NOT NULL,
    link_url TEXT NOT NULL,
    column_number INTEGER NOT NULL,
    display_order INTEGER DEFAULT 0
);

-- Contact Form Fields
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

-- CTA Buttons
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

-- Indexes for performance
CREATE INDEX idx_pages_slug ON pages(page_slug);
CREATE INDEX idx_sections_page ON sections(page_id);
CREATE INDEX idx_services_slug ON services(service_slug);
CREATE INDEX idx_faq_category ON faq_items(category_id);
CREATE INDEX idx_process_phase ON process_steps(phase_id);

