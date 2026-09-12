-- Documents table
CREATE TABLE IF NOT EXISTS documents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    filename VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_size BIGINT,
    file_type VARCHAR(50),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Screening results table
CREATE TABLE IF NOT EXISTS screening_results (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    document_id UUID REFERENCES documents(id),
    risk_score DECIMAL(3, 2),
    authenticity_level VARCHAR(50),
    is_fraudulent BOOLEAN DEFAULT FALSE,
    metadata_valid BOOLEAN,
    tampering_detected BOOLEAN,
    signature_valid BOOLEAN,
    details JSONB,
    screened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Proxy activity table
CREATE TABLE IF NOT EXISTS proxy_activities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ip_address INET,
    user_id VARCHAR(255),
    geo_location VARCHAR(255),
    is_proxy BOOLEAN DEFAULT FALSE,
    is_vpn BOOLEAN DEFAULT FALSE,
    risk_score DECIMAL(3, 2),
    suspicious_behaviors TEXT[],
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Audit log table
CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    action VARCHAR(255),
    resource_type VARCHAR(100),
    resource_id VARCHAR(255),
    user_id VARCHAR(255),
    details JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_documents_uploaded_at ON documents(uploaded_at);
CREATE INDEX IF NOT EXISTS idx_screening_results_document_id ON screening_results(document_id);
CREATE INDEX IF NOT EXISTS idx_screening_results_screened_at ON screening_results(screened_at);
CREATE INDEX IF NOT EXISTS idx_proxy_activities_ip_address ON proxy_activities(ip_address);
CREATE INDEX IF NOT EXISTS idx_proxy_activities_timestamp ON proxy_activities(timestamp);
CREATE INDEX IF NOT EXISTS idx_audit_logs_resource_id ON audit_logs(resource_id);
