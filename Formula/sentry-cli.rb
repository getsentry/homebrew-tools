class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.53.0"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.53.0/sentry-cli-Darwin-x86_64"
    sha256 "198d6a4554967197af7b37c20360efa62daae3e6726a414cd4c06689d14476a7"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.53.0/sentry-cli-Linux-x86_64"
    sha256 "b6b00850c9cac9f521e3158524e183c5cad09fe8b252a9be2d72107cae14e778"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.53.0/sentry-cli-Linux-i686"
    sha256 "1e376b6e46ddc7903a6e00ef510fe7a8a0b79ebf100e9e04a05e86f506c8713e"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
