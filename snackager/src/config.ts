import path from 'path';

type Config = {
  port: number;
  registry: string;
  tmpdir: string;
  url: string;
  redis: {
    url: string;
  };
  aws: {
    access_key: string;
    secret_key: string;
  };
  s3: {
    bucket: string;
    imports_bucket: string;
    region: string;
  };
  cloudfront: { url: string };
  api: { url: string };
  sentry?: { dsn: string };
};

function env(varName: string, testValue?: string): string {
  const envVar = process.env[varName];
  if (!envVar) {
    if (process.env.NODE_ENV === 'test' || process.argv[1].endsWith('cli.js')) {
      return testValue ?? 'noop';
    }
    throw new Error(`environment variable ${varName} isn't specified`);
  }
  return envVar;
}

const config: Config = {
  registry: 'https://registry.yarnpkg.com',
  port: parseInt(process.env.PORT ?? '3012', 10),
  tmpdir: path.join(process.env.TMPDIR ?? '/tmp', 'snackager'),
  url: env('IMPORT_SERVER_URL'),
  redis: {
    url: env('REDIS_URL'),
  },
  aws: {
    access_key: env('AWS_ACCESS_KEY_ID'),
    secret_key: env('AWS_SECRET_ACCESS_KEY'),
  },
  s3: {
    bucket: env('S3_BUCKET'),
    imports_bucket: env('IMPORTS_S3_BUCKET'),
    region: env('S3_REGION'),
  },
  cloudfront: {
    url: env('CLOUDFRONT_URL'),
  },
  api: {
    url: env('API_SERVER_URL', 'https://test.exp.host'),
  },
};

if (!process.env.DISABLE_INSTRUMENTATION && process.env.NODE_ENV === 'production') {
  config.sentry = {
    dsn: env('SENTRY_DSN'),
  };
}

export default config;
