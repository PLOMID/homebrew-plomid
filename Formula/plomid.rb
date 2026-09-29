class Plomid < Formula
  desc "PLOMID database server (PostgreSQL wire protocol)"
  homepage "https://github.com/PLOMID/plomid"
  version "0.1.0-beta.1"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/PLOMID/plomid/releases/download/v0.1.0-beta.1/plomid-v0.1.0-beta.1-macos-arm64.tar.gz"
    sha256 "3dc101b05a7240bbca7ecb03d5a8f3962f9287029dd2b652c1d361c2b752af19"
  end

  on_intel do
    url "https://github.com/PLOMID/plomid/releases/download/v0.1.0-beta.1/plomid-v0.1.0-beta.1-macos-x64.tar.gz"
    sha256 "c3d7b39fc284b467766ca7dae0aaab690c448a8fe924325f5881d551f809527f"
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
