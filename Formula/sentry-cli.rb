class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.4.0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.4.0/sentry-cli-Darwin-universal"
    sha256 "2c36031e19157e33a29661b241c4abf2c59a0d4e60bfe059ab48f88d93c881e9"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.0/sentry-cli-Linux-aarch64"
        sha256 "1273fe22639e394e0c8d2bd097da13b25139e75e977c5ce44c6f54130664ea45"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.0/sentry-cli-Linux-armv7"
        sha256 "26a07175b5c19d18f1b83f25f6a2fe685d639554f0bde116a6afc42186083485"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.0/sentry-cli-Linux-x86_64"
        sha256 "803556dd09de4fe54639c4d2e696315fd5a67dda3f8fe8dfe52a942ead5a2ae1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.0/sentry-cli-Linux-i686"
        sha256 "09863f5ca5f8b7542e9ae28f59fa731f29e1a0548c6c46c27c5324d502bc639c"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
