
-- Auto-approval trigger for automation (Part 3)
CREATE TRIGGER AutoApproveClaim
ON ClaimsDB


FOR dbo.Claims;
AFTER INSERT
AS 
BEGIN
    UPDATE dbo.Claims;
    SET Status = 'Approved', LastUpdated = GETDATE()
    FROM Claims c
    INNER JOIN inserted i ON c.ClaimID = i.ClaimID
    WHERE i.Hours <= 40 AND EXISTS (SELECT 1 FROM Documents d WHERE d.ClaimID = i.ClaimID)
END;
GO