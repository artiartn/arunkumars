-- Run automatically by Render when using the PostgreSQL add-on
-- Or paste into Render's PSQL console
CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  content TEXT NOT NULL,
  category TEXT NOT NULL,
  excerpt TEXT NOT NULL,
  tags TEXT[] NOT NULL DEFAULT '{}',
  file_url TEXT,
  file_type TEXT,
  published_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_posts_slug ON posts(slug);
CREATE INDEX IF NOT EXISTS idx_posts_category ON posts(category);
CREATE INDEX IF NOT EXISTS idx_posts_published_at ON posts(published_at DESC);
