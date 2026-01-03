# MonnyCreaX Website Database - Complete Documentation

## 📋 Overview

This is a complete database structure for the MonnyCreaX brand strategy website. The database contains all website content, organized in a relational structure that can be used with SQL databases (SQLite, MySQL, PostgreSQL) or exported to JSON for use with headless CMS, static site generators, or API endpoints.

## 📁 Files Included

1. **`monnycreax-website-database-complete.sql`** - Complete SQL schema with all seed data
2. **`monnycreax-website-database.json`** - Complete website content in JSON format
3. **`README.md`** - Quick reference guide
4. **`DATABASE_DOCUMENTATION.md`** - This comprehensive documentation

## 🗄️ Database Schema

### Core Tables

#### `site_metadata`
Stores global site information and contact details.

**Fields:**
- `brand_name` - "MonnyCreaX"
- `tagline` - "Where Clarity Meets Creativity"
- `founder_name` - "Bethwel Monny"
- `founder_title` - "Brand Strategist"
- `location` - "Nairobi, Kenya"
- `email` - "monnybethwel@gmail.com"
- `whatsapp` - "+254758434092"
- `instagram` - "@monnycreax"
- `working_hours_weekdays` - "Monday - Friday: 9:00 AM - 6:00 PM (EAT)"
- `working_hours_saturday` - "Limited availability"
- `working_hours_sunday` - "Closed"
- `serving_clients` - "East Africa, Africa, and globally (English-speaking)"
- `copyright_text` - "© 2026 MonnyCreaX. All rights reserved."

#### `pages`
Stores all website pages with metadata.

**Pages:**
- homepage
- about
- services
- process
- portfolio
- contact
- faq

#### `sections`
Stores content sections for each page.

**Section Types:**
- hero
- about
- problem
- solution
- how_it_works
- services_overview
- social_proof
- cta
- story
- approach
- values
- background
- why
- header
- office_hours
- booking

### Content Tables

#### `problem_statements`
Homepage problem statements (3 items):
1. You're Active But Not Effective
2. You Explain Yourself Repeatedly
3. You're Ready to Scale But Your Brand Won't Support It

#### `solution_pillars`
Homepage solution pillars (3 items):
1. Strategy First
2. Messaging That Lands
3. Direction You Can Implement

#### `how_it_works_steps`
4-step process overview for homepage:
1. Book Your Session
2. Complete Intake
3. The Intensive (3-4 Hours)
4. Receive Your Blueprint

### Services Tables

#### `services`
Three main services:
1. **Brand Clarity Intensive** - $500-$1,200
2. **Brand Strategy Retainer** - $1,500-$2,000/month
3. **Brand Audit & Consultation** - $300-$400

#### `service_target_audience`
Who each service is for.

#### `service_features`
What's included in each service, organized by category:
- `during_session`
- `after_session`
- `follow_up`
- `monthly`
- `quarterly_bonus`
- `what_you_get`

#### `service_pricing_tiers`
Pricing tiers for Brand Clarity Intensive:
1. Rapid Intensive - $500
2. Standard Intensive - $750
3. Premium Intensive - $1,200

#### `addon_services`
Additional services:
- Speaking & Workshops
- Execution Support
- Rush Service

### Process Tables

#### `process_phases`
5 phases of the process:
1. Phase 1: Inquiry to Booking
2. Phase 2: Preparation
3. Phase 3: The Intensive Session
4. Phase 4: Blueprint Delivery
5. Phase 5: Follow-Up & Support

#### `process_steps`
Detailed steps within each phase.

### FAQ Tables

#### `faq_categories`
4 categories:
1. General Questions
2. Service-Specific Questions
3. Process Questions
4. Investment Questions

#### `faq_items`
All FAQ questions and answers organized by category.

### Other Content Tables

#### `testimonials`
Client testimonials with author information.

#### `core_values`
5 core values:
1. Authenticity Over Perfection
2. Clarity Over Creativity
3. Strategy Over Speed
4. Service Over Sales
5. Purpose Over Profit

#### `approach_questions`
6 strategic questions used in the approach:
1. Who are you, really?
2. What do you stand for?
3. Who are you speaking to?
4. What problem do you solve?
5. Why should they choose you?
6. What do you want them to feel?

#### `why_monnycreax`
3 reasons to work with MonnyCreaX:
1. Strategy-First Approach
2. African Voice, Global Standard
3. Transformation, Not Transactions

#### `brand_colors`
5 brand colors:
- Deep Charcoal (#1C1C1C) - Primary
- Soft Gold (#D4AF37) - Secondary
- Clay Beige (#EAE2D6) - Tertiary
- Off White (#F7F7F4) - Background
- Sage Olive (#8A977B) - Accent

#### `typography`
Font specifications:
- Playfair Display (Headlines)
- Inter (Body text)
- DM Sans (Body text alternative)
- Space Grotesk (Accent text)

#### `contact_form_fields`
Contact form field definitions.

#### `contact_options`
Contact methods (Instagram, Email, WhatsApp).

#### `cta_buttons`
Call-to-action button variations.

#### `footer_links`
Footer navigation links organized by column.

#### `portfolio_categories`
5 portfolio categories for filtering.

#### `case_studies`
Case study structure (ready for client data).

#### `service_decision_tree`
Decision tree for choosing the right service.

## 🔧 Usage

### SQLite (Recommended for Development)

```bash
sqlite3 monnycreax.db < monnycreax-website-database-complete.sql
```

### MySQL/MariaDB

```bash
mysql -u username -p database_name < monnycreax-website-database-complete.sql
```

### PostgreSQL

```bash
psql -U username -d database_name -f monnycreax-website-database-complete.sql
```

### Using with JavaScript/TypeScript

```javascript
import database from './monnycreax-website-database.json';

// Access homepage hero
const heroHeadline = database.pages.homepage.hero.headline;

// Get all services
const services = database.pages.services.services;

// Contact information
const email = database.siteMetadata.contact.email;
const whatsapp = database.siteMetadata.contact.whatsapp;
```

### Using with Python

```python
import json

with open('monnycreax-website-database.json', 'r') as f:
    database = json.load(f)

# Access content
hero_headline = database['pages']['homepage']['hero']['headline']
services = database['pages']['services']['services']
```

### Using with Next.js

```javascript
// pages/index.js or app/page.js
import database from '../data/monnycreax-website-database.json';

export default function HomePage() {
  const hero = database.pages.homepage.hero;
  
  return (
    <div>
      <h1>{hero.headline}</h1>
      <p>{hero.subheadline}</p>
    </div>
  );
}
```

### Using with Headless CMS

The JSON structure can be imported into:
- Contentful
- Strapi
- Sanity
- Ghost
- WordPress (via JSON import plugin)

## 📊 Data Relationships

```
pages
  └── sections (one-to-many)
  └── problem_statements (one-to-many)
  └── solution_pillars (one-to-many)
  └── how_it_works_steps (one-to-many)

services
  └── service_target_audience (one-to-many)
  └── service_features (one-to-many)
  └── service_pricing_tiers (one-to-many)

process_phases
  └── process_steps (one-to-many)

faq_categories
  └── faq_items (one-to-many)

portfolio_categories
  └── case_studies (one-to-many)
```

## 🔍 Query Examples

### Get Homepage Hero Section

```sql
SELECT headline, subheadline, body 
FROM sections 
WHERE page_id = (SELECT id FROM pages WHERE page_slug = 'homepage')
  AND section_key = 'hero';
```

### Get All Services with Pricing

```sql
SELECT title, tagline, investment_min, investment_max, timeline
FROM services
ORDER BY display_order;
```

### Get FAQ by Category

```sql
SELECT f.question, f.answer
FROM faq_items f
JOIN faq_categories c ON f.category_id = c.id
WHERE c.category_name = 'General Questions'
ORDER BY f.display_order;
```

### Get Process Steps for Phase 3

```sql
SELECT step_title, step_description
FROM process_steps
WHERE phase_id = (SELECT id FROM process_phases WHERE phase_number = 3)
ORDER BY display_order;
```

### Get Service Features for Brand Clarity Intensive

```sql
SELECT feature_category, feature_text
FROM service_features
WHERE service_id = (SELECT id FROM services WHERE service_slug = 'intensive')
ORDER BY feature_category, display_order;
```

## 📝 Updating Content

### Adding a New Testimonial

```sql
INSERT INTO testimonials (quote, author_name, author_title, display_order, is_featured)
VALUES ('Your testimonial here', 'Client Name', 'Title', 4, 1);
```

### Adding a New Case Study

```sql
INSERT INTO case_studies (client_name, category_id, challenge, solution, results, display_order)
VALUES (
  'Client Name',
  (SELECT id FROM portfolio_categories WHERE category_name = 'Founders & Startups'),
  'Challenge description',
  'Solution description',
  'Results description',
  1
);
```

### Updating Service Pricing

```sql
UPDATE services
SET investment_min = '$600', investment_max = '$1,500'
WHERE service_slug = 'intensive';
```

### Adding a New FAQ

```sql
INSERT INTO faq_items (category_id, question, answer, display_order)
VALUES (
  (SELECT id FROM faq_categories WHERE category_name = 'General Questions'),
  'Your question?',
  'Your answer.',
  5
);
```

## 🎨 Brand Identity Data

### Colors
All brand colors are stored in `brand_colors` table with hex codes and descriptions.

### Typography
Font specifications in `typography` table.

### Visual Aesthetic
- Minimal but Warm
- African Sophistication
- Strategic Simplicity
- Editorial Style

## 📞 Contact Information

All contact information is stored in `site_metadata`:
- **Email:** monnybethwel@gmail.com
- **WhatsApp:** +254758434092
- **Instagram:** @monnycreax
- **Location:** Nairobi, Kenya

## 🔐 Security Notes

- Never commit database files with sensitive client data
- Use environment variables for database connections
- Sanitize all user inputs when updating content
- Use prepared statements for queries

## 🚀 Deployment Considerations

### For Static Sites
- Export JSON and use as static data
- No database needed
- Content can be version controlled

### For Dynamic Sites
- Use SQL database for content management
- Consider adding admin interface
- Implement caching for performance

### For Headless CMS
- Import JSON structure
- Map to CMS content types
- Use CMS API for content delivery

## 📈 Future Enhancements

Potential additions:
- Blog posts table
- Newsletter signups
- Client portal
- Booking system integration
- Analytics tracking
- A/B testing variants
- Multi-language support

## 📄 License

© 2026 MonnyCreaX. All rights reserved.

---

**MonnyCreaX** - Where Clarity Meets Creativity

For questions or support, contact: monnybethwel@gmail.com

