
-- # Copyright (C) 2021 Humanitarian OpenStreetmap Team

-- # This program is free software: you can redistribute it and/or modify
-- # it under the terms of the GNU Affero General Public License as
-- # published by the Free Software Foundation, either version 3 of the
-- # License, or (at your option) any later version.

-- # This program is distributed in the hope that it will be useful,
-- # but WITHOUT ANY WARRANTY; without even the implied warranty of
-- # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- # GNU Affero General Public License for more details.

-- # You should have received a copy of the GNU Affero General Public License
-- # along with this program.  If not, see <https://www.gnu.org/licenses/>.

-- # Humanitarian OpenStreetmap Team
-- # 1100 13th Street NW Suite 800 Washington, D.C. 20005
-- # <info@hotosm.org>

-- CREATE INDEX IF NOT EXISTS   nodes_uid_idx ON public.nodes USING btree (uid);
-- CREATE INDEX IF NOT EXISTS   nodes_changeset_idx ON public.nodes USING btree (changeset);

-- CREATE INDEX IF NOT EXISTS  ways_line_uid_idx ON public.ways_line USING btree (uid);
-- CREATE INDEX IF NOT EXISTS  ways_line_changeset_idx ON public.ways_line USING btree (changeset);

-- CREATE INDEX IF NOT EXISTS  ways_poly_uid_idx ON public.ways_poly USING btree (uid);
-- CREATE INDEX IF NOT EXISTS  ways_poly_changeset_idx ON public.ways_poly USING btree (changeset);

-- CREATE INDEX IF NOT EXISTS  relations_uid_idx ON public.relations USING btree (uid);
-- CREATE INDEX IF NOT EXISTS  relations_changeset_idx ON public.relations USING btree (changeset);


CREATE EXTENSION IF NOT EXISTS btree_gist;
CREATE EXTENSION IF NOT EXISTS postgis;

ALTER TABLE nodes
ADD CONSTRAINT nodes_pk PRIMARY KEY  (osm_id);

ALTER TABLE ways_line
ADD CONSTRAINT ways_line_pk PRIMARY KEY  (osm_id);

ALTER TABLE ways_poly
ADD CONSTRAINT ways_poly_pk PRIMARY KEY  (osm_id);

ALTER TABLE relations
ADD CONSTRAINT relations_pk PRIMARY KEY (osm_id);


CREATE INDEX IF NOT EXISTS nodes_timestamp_idx ON public.nodes USING btree ("timestamp");

CREATE INDEX IF NOT EXISTS ways_line_timestamp_idx ON public.ways_line USING btree ("timestamp");

CREATE INDEX IF NOT EXISTS ways_poly_timestamp_idx ON public.ways_poly USING btree ("timestamp");

CREATE INDEX IF NOT EXISTS relations_tags_idx ON public.relations USING gin (tags);

CREATE INDEX IF NOT EXISTS relations_timestamp_idx ON public.relations USING btree ("timestamp");



