class Plomid < Formula
  desc "PLOMID database server (PostgreSQL wire protocol)"
  homepage "https://github.com/PLOMID/plomid"
  version "0.1.0-beta.1"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/PLOMID/plomid/releases/download/v0.1.0-beta.1/plomid-v0.1.0-beta.1-macos-arm64.tar.gz"
    sha256 "cf7408eebb7cf79e8f873f851bf3c31fce7a1f823fa13e1da42cefdc773cf609"
  end

  on_intel do
    url "https://github.com/PLOMID/plomid/releases/download/v0.1.0-beta.1/plomid-v0.1.0-beta.1-macos-x64.tar.gz"
    sha256 "9cfc168facad56e2d7d937312778ed8e35d197cb024fc354cfde9a6337493871"
  end

  def install
    bin.install "plomid-server"
  end

  service do
    run [opt_bin/"plomid-server", "--data", var/"plomid", "--host", "127.0.0.1", "--port", "5432"]
    keep_alive true
    log_path var/"log/plomid.log"
    error_log_path var/"log/plomid.log"
  end

  test do
    assert_match "plomid", shell_output("#{bin}/plomid-server --help 2>&1", 0)
  end
end
