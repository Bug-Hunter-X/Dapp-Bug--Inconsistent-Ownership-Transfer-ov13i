function transferOwnership(newOwner) {
  require(newOwner != address(0), "Ownable: new owner is the zero address");
  try {
    _transferOwnership(newOwner);
  } catch (bytes memory reason) {
    // Handle exceptions appropriately, e.g., revert or log the error
    if (reason.length > 0) {
      assembly {
        revert(add(32, reason), mload(reason))
      }
    }
    revert("Ownership transfer failed");
  }
}

function _transferOwnership(newOwner) {
  emit OwnershipTransferred(owner, newOwner);
  owner = newOwner;
}