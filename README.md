# MonnyCreaX Website Database

Complete website content database for MonnyCreaX brand strategy website.

## 📁 Files

- **`monnycreax-website-database-complete.sql`** - Complete SQL schema with all seed data (Recommended)
- **`monnycreax-website-database.json`** - Complete website content in JSON format
- **`DATABASE_DOCUMENTATION.md`** - Comprehensive database documentation
- **`README.md`** - This quick reference guide

## 🚀 Quick Start

### Using SQL Database

```bash
# SQLite (Recommended for development)
sqlite3 monnycreax.db < monnycreax-website-database-complete.sql

# MySQL
mysql -u username -p database_name < monnycreax-website-database-complete.sql

# PostgreSQL
psql -U username -d database_name -f monnycreax-website-database-complete.sql
```

### Using JSON

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

## 📋 Database Structure

### Core Tables
- **`site_metadata`** - Global site info and contact details
- **`pages`** - All website pages (homepage, about, services, process, portfolio, contact, faq)
- **`sections`** - Content sections for each page

### Content Tables
- **`problem_statements`** - Homepage problem statements
- **`solution_pillars`** - Homepage solution pillars
- **`how_it_works_steps`** - 4-step process overview
- **`services`** - Three main services
- **`service_features`** - What's included in each service
- **`service_pricing_tiers`** - Pricing tiers for intensives
- **`process_phases`** - 5 phases of the process
- **`process_steps`** - Detailed steps within each phase
- **`faq_categories`** - FAQ categories
- **`faq_items`** - All FAQ questions and answers
- **`testimonials`** - Client testimonials
- **`core_values`** - 5 core values
- **`brand_colors`** - Brand color palette
- **`typography`** - Font specifications

## 🔗 Contact Information

- **Email:** monnybethwel@gmail.com
- **WhatsApp:** +254758434092
- **Instagram:** @monnycreax
- **Location:** Nairobi, Kenya

## 📱 Services

1. **Brand Clarity Intensive** - $500-$1,200
   - Rapid: $500
   - Standard: $750
   - Premium: $1,200

2. **Brand Strategy Retainer** - $1,500-$2,000/month

3. **Brand Audit & Consultation** - $300-$400

## 🎨 Brand Colors

- **Deep Charcoal:** #1C1C1C (Primary)
- **Soft Gold:** #D4AF37 (Secondary)
- **Clay Beige:** #EAE2D6 (Tertiary)
- **Off White:** #F7F7F4 (Background)
- **Sage Olive:** #8A977B (Accent)

## 💻 Usage Examples

### Next.js
```javascript
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

### Python
```python
import json

with open('monnycreax-website-database.json', 'r') as f:
    database = json.load(f)

hero_headline = database['pages']['homepage']['hero']['headline']
```

## 📊 Query Examples

### Get Homepage Hero
```sql
SELECT headline, subheadline, body 
FROM sections 
WHERE page_id = (SELECT id FROM pages WHERE page_slug = 'homepage')
  AND section_key = 'hero';
```

### Get All Services
```sql
SELECT title, tagline, investment_min, investment_max
FROM services
ORDER BY display_order;
```

### Get FAQ by Category
```sql
SELECT f.question, f.answer
FROM faq_items f
JOIN faq_categories c ON f.category_id = c.id
WHERE c.category_name = 'General Questions';
```

## 📝 Updating Content

### Add New Testimonial
```sql
INSERT INTO testimonials (quote, author_name, author_title, display_order, is_featured)
VALUES ('Your testimonial', 'Client Name', 'Title', 4, 1);
```

### Update Service Pricing
```sql
UPDATE services
SET investment_min = '$600', investment_max = '$1,500'
WHERE service_slug = 'intensive';
```

## 🔄 Use Cases

1. **Static Site Generators** - Next.js, Gatsby, Hugo, Jekyll
2. **Headless CMS** - Contentful, Strapi, Sanity, Ghost
3. **API Backend** - REST or GraphQL API endpoints
4. **Content Management** - Admin interface for content updates

## 📚 Documentation

For comprehensive documentation, see **`DATABASE_DOCUMENTATION.md`**

## 📄 License

© 2026 MonnyCreaX. All rights reserved.

---

**MonnyCreaX** - Where Clarity Meets Creativity

